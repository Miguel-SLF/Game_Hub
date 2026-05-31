//tela principal da home

import 'package:flutter/material.dart';
import 'lista_jogos.dart';
import 'tela_meus_jogos.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indiceSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: Text("Game Hub", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1E1F22),
        automaticallyImplyLeading: false,
      ),
      
      body: ListaJogos(),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado, 
        backgroundColor: Color(0xFF1E1F22),
        selectedItemColor: const Color.fromARGB(255, 72, 27, 146),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Meus Jogos"),
        ],
        onTap: (int index) {
          if (index != _indiceSelecionado) {
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TelaMeusJogos()), 
              );
            }
          }
        },
      ),
    );
  }
}