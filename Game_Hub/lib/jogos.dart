// modelos de lojas e jogos

// model principal de jogo com todos os dados necessários
class Jogos {
  final int id;
  final String nome;
  final String capa;
  final String banner;
  final String plataforma;
  final String descricao;

  // estados do jogo na biblioteca do usuário
  bool adquirido;
  bool jogando;
  bool zerado;

  Jogos({
    this.id = 0,
    required this.nome,
    required this.capa,
    required this.banner,
    this.plataforma = '',
    required this.descricao,
    required this.adquirido,
    required this.jogando,
    required this.zerado,
  });

  // conversao do JSON da API para um objeto Jogos
  factory Jogos.fromJson(Map<String, dynamic> json) {
    // trata a URL da capa, substituindo o tamanho padrão pelo tamanho grande
    String urlCapa = 'https://via.placeholder.com/150';
    if (json['cover'] != null && json['cover']['url'] != null) {
      urlCapa = 'https:${json['cover']['url']}';
      urlCapa = urlCapa.replaceAll('t_thumb', 't_cover_big');
    }

    // extrai e une os nomes das plataformas separa por " | "
    String nomesPlataformas = 'Desconhecida';
    if (json['platforms'] != null) {
      List plataformasLista = json['platforms'];
      nomesPlataformas = plataformasLista.map((p) => p['name']).join(' | ');
    }

    // trata o banner usando o primeiro artwork em resolução 1080p
    String urlBanner = urlCapa;
    if (json['artworks'] != null && json['artworks'].isNotEmpty) {
      urlBanner = 'https:${json['artworks'][0]['url']}';
      urlBanner = urlBanner.replaceAll('t_thumb', 't_1080p');
    }

    // retorna o objeto montado com os dados tratados, estados iniciados como false
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

  // conversao do JSON do back-end (já vem no formato final) para um objeto Jogos
  factory Jogos.fromBackendJson(Map<String, dynamic> json) {
    return Jogos(
      id: json['id'] ?? 0,
      nome: json['nome'] ?? 'Sem Nome',
      capa: json['capa'] ?? '',
      banner: json['banner'] ?? '',
      plataforma: json['plataforma'] ?? '',
      descricao: json['descricao'] ?? '',
      adquirido: json['adquirido'] ?? false,
      jogando: json['jogando'] ?? false,
      zerado: json['zerado'] ?? false,
    );
  }

  // conversao do objeto para JSON para enviar ao back-end
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'capa': capa,
      'banner': banner,
      'plataforma': plataforma,
      'descricao': descricao,
      'adquirido': adquirido,
      'jogando': jogando,
      'zerado': zerado,
    };
  }
}