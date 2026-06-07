// tela de jogos adiquiridos

// imports
import 'package:flutter/material.dart';
import 'lista_meus_jogos.dart';
import 'tela_principal.dart';
import 'jogos.dart';

class TelaMeusJogos extends StatefulWidget {
  @override
  State<TelaMeusJogos> createState() => _TelaMeusJogosState();
}

class _TelaMeusJogosState extends State<TelaMeusJogos> {
  final int _indiceSelecionado = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: Text("Game Hub", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1E1F22),
        automaticallyImplyLeading: false,
      ),

      // exibe a lista de jogos adiquiridos
      body: ListaMeusJogos(jogos: meusJogos),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado,
        backgroundColor: Color(0xFF1E1F22),
        selectedItemColor: Color.fromARGB(255, 72, 27, 146),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Meus Jogos"),
        ],
        // navega para a tela principal ao clicar em Home
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TelaPrincipal()),
            );
          }
        },
      ),
    );
  }
}