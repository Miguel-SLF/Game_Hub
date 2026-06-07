//tela principal da home

import 'package:flutter/material.dart';
import 'lista_jogos.dart';
import 'tela_meus_jogos.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Índice 0 pois esta é a tela Home
  final int _indiceSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 70, 75),
      appBar: AppBar(
        title: const Text("Game Hub", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E1F22),
        automaticallyImplyLeading: false, // Remove a seta de voltar, já que é a Home
      ),
      
      body: ListaJogos(), // Exibe a sua lista da API
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceSelecionado, 
        backgroundColor: const Color(0xFF1E1F22),
        selectedItemColor: const Color.fromARGB(255, 72, 27, 146),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed, // Garante que as cores funcionem bem
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: "Meus Jogos"),
        ],
        onTap: (int index) {
          // Se o usuário clicar em "Meus Jogos" (índice 1), ele navega para a outra tela
          if (index == 1) {
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