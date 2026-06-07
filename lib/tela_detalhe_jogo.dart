//pagina de cada jogo separadamente

import 'package:flutter/material.dart';
import 'jogos.dart'; // Importante para acessar a lista global 'meusJogos'

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
      backgroundColor: const Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: Text(widget.jogo.nome, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E1F22),
        iconTheme: const IconThemeData(color: Colors.cyanAccent),
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
              padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(width: 16), 
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jogo.nome, 
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                            const SizedBox(height: 4),
                            // Exibindo Plataformas (Corrigido)
                            Text(
                              widget.jogo.plataforma.isNotEmpty 
                                  ? widget.jogo.plataforma 
                                  : "Plataforma indisponível",
                              style: const TextStyle(
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
                  
                  const Divider(height: 30, color: Colors.grey),

                  Text(
                    widget.jogo.descricao, 
                    style: const TextStyle(fontSize: 16, color: Colors.white) 
                  ),
                  const Divider(height: 30, color: Colors.grey),
                  
                  // BOTÕES DE CONTROLE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ADQUIRIDO
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.jogo.adquirido = !widget.jogo.adquirido;
                            // Lógica Global
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
                            const SizedBox(width: 5),
                            const Text("Adquirido", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      
                      // JOGANDO
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
                            const SizedBox(width: 5),
                            const Text("Jogando", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      
                      // ZERADO
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
                            const SizedBox(width: 5),
                            const Text("Zerado", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}