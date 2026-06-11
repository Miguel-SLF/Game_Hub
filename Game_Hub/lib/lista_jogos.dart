// lista de jogos exibida na tela principal

// imports
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'tela_detalhe_jogo.dart';
import 'services/api_service.dart';
import 'services/backend_service.dart';
import 'jogos.dart';

class ListaJogos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaJogosState();
  }
}

class _ListaJogosState extends State<ListaJogos> {
  final ApiService apiService = ApiService();
  final BackendService backendService = BackendService();
  final TextEditingController _controladorPesquisa = TextEditingController();
  late Future<List<Jogos>> _futurosJogos;

  // inicia a busca dos jogos assim que o widget é criado
  @override
  void initState() {
    super.initState();
    _futurosJogos = _carregarJogos();
  }

  @override
  void dispose() {
    _controladorPesquisa.dispose();
    super.dispose();
  }

  // refaz a busca usando o que foi digitado no campo
  void _pesquisar() {
    setState(() {
      _futurosJogos = _carregarJogos();
    });
  }

  // busca os jogos na IGDB e aplica por cima os status salvos no banco
  Future<List<Jogos>> _carregarJogos() async {
    final nome = _controladorPesquisa.text.trim();

    // se o campo estiver vazio mostra os jogos em alta, senão pesquisa pelo nome
    final jogos = nome.isEmpty
        ? await apiService.buscarJogosEmAlta()
        : await apiService.buscarJogosPorNome(nome);

    try {
      final salvos = await backendService.buscarTodosStatus();
      final statusPorId = {for (var s in salvos) s.id: s};

      for (final jogo in jogos) {
        final salvo = statusPorId[jogo.id];
        if (salvo != null) {
          jogo.adquirido = salvo.adquirido;
          jogo.jogando = salvo.jogando;
          jogo.zerado = salvo.zerado;
        }
      }
    } catch (e) {
      // se o back-end estiver fora do ar, exibe a lista sem os status salvos
      print('Erro ao buscar status no back-end: $e');
    }

    return jogos;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              // campo para digitar o nome do jogo
              Expanded(
                child: TextField(
                  controller: _controladorPesquisa,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Pesquisar jogo...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xFF1E1F22),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  // pesquisa tambem ao apertar enter no teclado
                  onSubmitted: (value) => _pesquisar(),
                ),
              ),

              SizedBox(width: 10),

              // botao redondo com a lupa
              InkWell(
                onTap: _pesquisar,
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 72, 27, 146),
                  ),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        // lista de jogos abaixo do campo de pesquisa
        Expanded(child: _montarLista()),
      ],
    );
  }

  // aguarda a resposta da API antes de renderizar a lista
  Widget _montarLista() {
    return FutureBuilder<List<Jogos>>(
      future: _futurosJogos,
      builder: (context, snapshot) {
        // loading enquanto aguarda a resposta
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        // mensagem de erro se a requisição falhar
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar: ${snapshot.error}', style: const TextStyle(color: Colors.white)),
          );
        // mensagem se não houver jogos retornados
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('Nenhum jogo encontrado.', style: TextStyle(color: Colors.white)),
          );
        }

        List<Jogos> _jogos = snapshot.data!;

        // monta a lista de jogos
        return ListView.builder(
          itemCount: _jogos.length,
          itemBuilder: (context, index) {
            final jogo = _jogos[index];

            // cada item é clicável e navega para a tela de detalhe
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDetalheJogo(jogo: jogo),
                  ),
                ).then((value) => setState(() {})); // atualiza a lista ao voltar 
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    // capa do jogo c
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: CachedNetworkImage(
                        imageUrl: jogo.capa,
                        width: 70,
                        height: 105,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 70, height: 105, color: Colors.grey[900],
                          child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey)),
                        ),
                      ),
                    ),

                    SizedBox(width: 16),

                    // nome e plataformas do jogo
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jogo.nome,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 6),
                          Text(
                            jogo.plataforma,
                            style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 119, 118, 118)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // corta o texto se for muito longo
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}