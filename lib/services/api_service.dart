import 'dart:convert';
import 'package:http/http.dart' as http;
import '/jogos.dart'; 

class ApiService {
  static const String _url = 'https://api.igdb.com/v4/games';
  
  static const String _clientId = 'h43hdklri6401ol5a2963yhpulbt33'; 
  static const String _token = 'htnsse48fgknb7gzql102e3r2yyk1e'; 

  Future<List<Jogos>> buscarJogosEmAlta() async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json',
      },
body: 'fields id, name, cover.url, platforms.name, summary, artworks.url; where rating > 85 & rating_count > 500 & cover != null & artworks != null; sort rating_count desc; limit 15;',    );
    if (response.statusCode == 200) {
      final List dados = json.decode(response.body);
      return dados.map((json) => Jogos.fromJson(json)).toList();
    } else {
      print('Erro da IGDB: ${response.body}'); 
      throw Exception('Falha ao carregar os jogos');
    }
  }
}