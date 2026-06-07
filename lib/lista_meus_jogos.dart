// lista de jogos salvos 

// imports
import 'package:flutter/material.dart';
import 'jogos.dart';
import 'tela_detalhe_jogo.dart';

// recebe a lista de jogos da tela meus jogos
class ListaMeusJogos extends StatefulWidget {
  final List<Jogos> jogos;

  ListaMeusJogos({required this.jogos});

  @override
  State<ListaMeusJogos> createState() => _ListaMeusJogosState();
}

class _ListaMeusJogosState extends State<ListaMeusJogos> {

  @override
  Widget build(BuildContext context) {
    // mensagem se a biblioteca estiver vazia
    if (widget.jogos.isEmpty) {
      return Center(
        child: Text(
          "Nenhum jogo adicionado à biblioteca.",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }

    // monta a lista de jogos salvos
    return ListView.builder(
      itemCount: widget.jogos.length,
      itemBuilder: (context, index) {
        final jogo = widget.jogos[index];

        // envia para a tela de detalhe
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
                // capa do jogo 
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    jogo.capa,
                    width: 70,
                    height: 105,
                    fit: BoxFit.cover,
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        jogo.plataforma.isNotEmpty ? jogo.plataforma : "N/A", // exibe N/A se não tiver plataforma
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, 
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
  }
}