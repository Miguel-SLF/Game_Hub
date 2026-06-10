// raiz do app

// imports
import 'package:flutter/material.dart';
import 'tela_principal.dart';

class GameHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, 
      home: TelaPrincipal(), // chama a tela principal como tela inicial
    );
  }
}