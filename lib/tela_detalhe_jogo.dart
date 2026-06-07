//pagina de cada jogo separadamente

import 'package:flutter/material.dart';
import 'jogos.dart'; 

class TelaDetalheJogo extends StatefulWidget {
  final Jogos jogo; 

  TelaDetalheJogo({super.key, required this.jogo});

  @override
  State<TelaDetalheJogo> createState() => _TelaDetalheJogoState();
}

class _TelaDetalheJogoState extends State<TelaDetalheJogo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: Text(widget.jogo.nome, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1E1F22),
        iconTheme: IconThemeData(color: Colors.cyanAccent),
      ),
      
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.jogo.banner,
              height: 180,
              width: double.infinity, 
              fit: BoxFit.cover,
            ), 
            
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.jogo.capa,
                          width: 100, 
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16), 
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jogo.nome, 
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.jogo.plataforma.isNotEmpty 
                                  ? widget.jogo.plataforma 
                                  : "Plataforma indisponível",
                              style: TextStyle(
                                fontSize: 14, 
                                fontStyle: FontStyle.italic, 
                                color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  Divider(height: 30, color: Colors.grey),

                  Text(
                    widget.jogo.descricao, 
                    style: TextStyle(fontSize: 16, color: Colors.white) 
                  ),
                  Divider(height: 30, color: Colors.grey),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.jogo.adquirido = !widget.jogo.adquirido;
                            if (widget.jogo.adquirido) {
                              if (!meusJogos.contains(widget.jogo)) {
                                meusJogos.add(widget.jogo);
                              }
                            } else {
                              meusJogos.remove(widget.jogo);
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: widget.jogo.adquirido ? Colors.green : Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text("Adquirido", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.jogo.jogando = !widget.jogo.jogando;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.gamepad_outlined,
                              color: widget.jogo.jogando ? Colors.green : Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text("Jogando", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                                            InkWell(
                        onTap: () {
                          setState(() {
                            widget.jogo.zerado = !widget.jogo.zerado;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: widget.jogo.zerado ? Colors.green : Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text("Zerado", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}