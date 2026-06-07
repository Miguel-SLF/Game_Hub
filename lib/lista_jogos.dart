// lista dos jogos da tela principal

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
  final ApiService apiService = ApiService();
  late Future<List<Jogos>> _futurosJogos; 

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
          return  Center(child: CircularProgressIndicator(color: Colors.white));
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erro ao carregar: ${snapshot.error}', style: const TextStyle(color: Colors.white)),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return  Center(
            child: Text('Nenhum jogo encontrado.', style: TextStyle(color: Colors.white)),
          );
        }

        List<Jogos> _jogos = snapshot.data!;

        return ListView.builder(
          itemCount: _jogos.length,
          itemBuilder: (context, index) {
            final jogo = _jogos[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDetalheJogo(jogo: jogo),
                  ),
                ).then((value) => setState(() {})); 
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: CachedNetworkImage(
                        imageUrl: jogo.capa,
                        width: 70,   
                        height: 105, 
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 70, height: 105, color: Colors.grey[900],
                          child:  Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.grey)),
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 16),
                    
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
      },
    );
  }
}