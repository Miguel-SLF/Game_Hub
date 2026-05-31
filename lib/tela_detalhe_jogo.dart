//pagina de cada jogo separadamente

import 'package:flutter/material.dart';
import 'jogos.dart';
import 'tela_meus_jogos.dart';

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
      appBar: AppBar(
        title: Text(widget.jogo.nome, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1E1F22),
        iconTheme: const IconThemeData(
          color: Colors.cyanAccent, // Coloquei o Ciano para combinar com o menu, mas pode ser Colors.white!
        ),
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
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.jogo.lojas.map((l) => l.nome).join(" | "), 
                              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey)
                            ), 
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const Divider(height: 30),

                  Text(
                    widget.jogo.descricao, 
                    style: const TextStyle(fontSize: 16) 
                  ),
                  const Divider(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.jogo.adquirido = !widget.jogo.adquirido;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: widget.jogo.adquirido ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            const Text("Adquirido"),
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.gamepad_outlined,
                              color: widget.jogo.jogando ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            const Text("Jogando"),
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: widget.jogo.zerado ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            const Text("Zerado"),
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
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E1F22),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Meus Jogos"),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TelaMeusJogos()), 
            );
          }
        },
      ),
    );
  }
}