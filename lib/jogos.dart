class Lojas {
  String nome;
  String imagem;

  Lojas({required this.nome, required this.imagem});
}

class Jogos {
  final int id;
  final String nome;
  final String capa;
  final String banner;
  final String plataforma; 
  final List<Lojas> lojas;
  final String descricao;
  
  bool adquirido;
  bool jogando;
  bool zerado;

  Jogos({
    this.id = 0, 
    required this.nome,
    required this.capa,
    required this.banner,
    this.plataforma = '', 
    this.lojas = const [], 
    required this.descricao,
    required this.adquirido,
    required this.jogando,
    required this.zerado,
  });

  factory Jogos.fromJson(Map<String, dynamic> json) {
    // 1. Tratar a Capa 
    String urlCapa = 'https://via.placeholder.com/150';
    if (json['cover'] != null && json['cover']['url'] != null) {
      urlCapa = 'https:${json['cover']['url']}';
      urlCapa = urlCapa.replaceAll('t_thumb', 't_cover_big'); 
    }

    // 2. Extrair plataformas
    String nomesPlataformas = 'Desconhecida';
    if (json['platforms'] != null) {
      List plataformasLista = json['platforms'];
      nomesPlataformas = plataformasLista.map((p) => p['name']).join(' | ');
    }

    // 3. Tratar o Banner usando Artworks 
    String urlBanner = urlCapa;
    if (json['artworks'] != null && json['artworks'].isNotEmpty) {
      urlBanner = 'https:${json['artworks'][0]['url']}';
      urlBanner = urlBanner.replaceAll('t_thumb', 't_1080p'); 
    }

    return Jogos(
      id: json['id'] ?? 0,
      nome: json['name'] ?? 'Sem Nome',
      capa: urlCapa,
      banner: urlBanner, 
      plataforma: nomesPlataformas,
      descricao: json['summary'] ?? 'Sem descrição disponível.',
      adquirido: false, 
      jogando: false,
      zerado: false,
    );
  }
}
List<Jogos> meusJogos = [];