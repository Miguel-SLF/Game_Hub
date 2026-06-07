// lista dos jogos da tela meus jogos

import 'package:flutter/material.dart';
import 'jogos.dart';
import 'tela_detalhe_jogo.dart';

class ListaMeusJogos extends StatefulWidget {
  final List<Jogos> jogos; // 1. Adicione esta linha

  ListaMeusJogos({required this.jogos}); // 2. Adicione o construtor

  @override
  State<ListaMeusJogos> createState() => _ListaMeusJogosState();
}

class _ListaMeusJogosState extends State<ListaMeusJogos> {
  // Acessamos a lista global diretamente

  @override
  Widget build(BuildContext context) {
    if (widget.jogos.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum jogo adicionado à biblioteca.",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.jogos.length,
      itemBuilder: (context, index) {
        final jogo = widget.jogos[index];

        return InkWell(
          onTap: () {
            // Ao voltar da tela de detalhes, forçamos o setState para atualizar a lista
            // caso o usuário tenha removido o jogo da biblioteca por lá.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaDetalheJogo(jogo: jogo),
              ),
            ).then((value) => setState(() {})); 
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    jogo.capa,
                    width: 70, 
                    height: 105, 
                    fit: BoxFit.cover, 
                  ),
                ),
                
                const SizedBox(width: 16), 
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jogo.nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white, 
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        jogo.plataforma.isNotEmpty ? jogo.plataforma : "N/A",
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
                
                const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}