// comunicação com a API do back-end (armazena os status dos jogos no banco)

// imports
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import '/jogos.dart';

class BackendService {
  // endereço da API; o emulador Android acessa o localhost do PC pelo IP 10.0.2.2
  static String get _baseUrl {
    if (!kIsWeb && Platform.isAndroid) {
      return 'http://10.0.2.2:5025/api/jogos';
    }
    return 'http://localhost:5025/api/jogos';
  }

  // busca todos os jogos com algum status salvo no banco
  Future<List<Jogos>> buscarTodosStatus() async {
    final response = await http.get(Uri.parse('$_baseUrl/'));

    if (response.statusCode == 200) {
      final List dados = json.decode(response.body);
      return dados.map((json) => Jogos.fromBackendJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os status dos jogos');
    }
  }

  // busca apenas os jogos adquiridos (tela meus jogos)
  Future<List<Jogos>> buscarMeusJogos() async {
    final response = await http.get(Uri.parse('$_baseUrl/meus'));

    if (response.statusCode == 200) {
      final List dados = json.decode(response.body);
      return dados.map((json) => Jogos.fromBackendJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar meus jogos');
    }
  }

  // salva (cria ou atualiza) o status de um jogo no banco
  Future<void> salvarStatus(Jogos jogo) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${jogo.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(jogo.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao salvar o status do jogo');
    }
  }
}
