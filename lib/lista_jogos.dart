//lista de jogos da tela home

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; 
import 'tela_detalhe_jogo.dart';
import 'services/api_service.dart'; 
import 'jogos.dart';


class ListaJogos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaJogosState();
  }
}

class _ListaJogosState extends State<ListaJogos> {
  // MUDANÇA: Removida a lista fixa _jogos = jogosIniciais;
  final ApiService apiService = ApiService(); // MUDANÇA: Instância da classe que vai buscar os dados
  late Future<List<Jogos>> _futurosJogos; // MUDANÇA: Variável que aguarda a resposta assíncrona da API

  @override
  void initState() {
    super.initState();
    _futurosJogos = apiService.buscarJogosEmAlta(); 
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Jogos>>(
      future: _futurosJogos,
      builder: (context, snapshot) {
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        } 
        else if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar jogos: ${snapshot.error}', style: const TextStyle(color: Colors.white)),
          );
        } 
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhum jogo encontrado.', style: TextStyle(color: Colors.white)),
          );
        }

        List<Jogos> _jogos = snapshot.data!;

        return ListView.builder(
          itemCount: _jogos.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDetalheJogo(jogo: _jogos[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: CachedNetworkImage(
                        imageUrl: _jogos[index].capa,
                        width: 70,   
                        height: 105, 
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 70,
                          height: 105,
                          color: Colors.grey[900],
                          child: const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey)),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 70,
                          height: 105,
                          color: Colors.grey[900],
                          child: const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _jogos[index].nome,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white, 
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _jogos[index].plataforma,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 119, 118, 118), 
                            ),
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.white),
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