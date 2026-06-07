//tela meus jogos

import 'package:flutter/material.dart';
import 'lista_meus_jogos.dart';
import 'tela_principal.dart'; 
import 'jogos.dart'; // Importante para acessar a lista global 'meusJogos'

class TelaMeusJogos extends StatefulWidget {
  @override
  State<TelaMeusJogos> createState() => _TelaMeusJogosState();
}

class _TelaMeusJogosState extends State<TelaMeusJogos> {
  final int _indiceSelecionado = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: const Text("Game Hub", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E1F22),
        automaticallyImplyLeading: false,
      ),
      
      // Passamos a lista global 'meusJogos' diretamente para o componente
      body: ListaMeusJogos(jogos: meusJogos),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado, 
        backgroundColor: const Color(0xFF1E1F22),
        selectedItemColor: const Color.fromARGB(255, 72, 27, 146),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Meus Jogos"),
        ],
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