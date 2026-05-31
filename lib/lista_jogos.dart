//lista de jogos da tela home

import 'package:flutter/material.dart';
import 'jogos.dart';
import 'tela_detalhe_jogo.dart';

class ListaJogos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaJogosState();
  }
}

class _ListaJogosState extends State<ListaJogos> {
  List<Jogos> _jogos = jogosIniciais;

  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(
                    _jogos[index].capa,
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
                        _jogos[index].nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white, // Título em branco
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _jogos[index].lojas.map((loja) => loja.nome).join(" | "),
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 119, 118, 118), // Lojas em cinza claro
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