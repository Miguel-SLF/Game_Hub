// "banco de dados fake"
class Lojas {
  String nome;
  String imagem;

  Lojas({required this.nome, required this.imagem});
}

Lojas steam = Lojas(nome: "Steam", imagem: "https://via.placeholder.com/50");
Lojas epicGames = Lojas(nome: "Epic Games", imagem: "https://via.placeholder.com/50");
Lojas xboxStore = Lojas(nome: "Xbox Store", imagem: "https://via.placeholder.com/50");
Lojas nintendoEshop = Lojas(nome: "Nintendo eShop", imagem: "https://via.placeholder.com/50");
Lojas playStationStore = Lojas(nome: "PlayStation Store", imagem: "https://via.placeholder.com/50");
Lojas gog = Lojas(nome: "GOG", imagem: "https://via.placeholder.com/50");

class Jogos {
  int id; // NOVO: Essencial para APIs e Banco de Dados Local
  String nome;
  String capa;
  String banner;
  String plataforma; // NOVO: Para receber os dados da API
  List<Lojas> lojas;
  String descricao;
  bool adquirido;
  bool jogando;
  bool zerado;

  Jogos({
    this.id = 0, // Padrão 0 para os dados falsos não quebrarem
    required this.nome,
    required this.capa,
    required this.banner,
    this.plataforma = '', // Padrão vazio para os dados falsos
    this.lojas = const [], // Tornou-se opcional para a API
    required this.descricao,
    required this.adquirido,
    required this.jogando,
    required this.zerado,
  });

factory Jogos.fromJson(Map<String, dynamic> json) {
  // 1. Tratar a Capa (Vertical)
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

  // 3. NOVO: Tratar o Banner usando "Artworks" (Artes Oficiais)
  String urlBanner = urlCapa; 
  if (json['artworks'] != null && json['artworks'].isNotEmpty) {
    // Pegamos a primeira artwork oficial
    urlBanner = 'https:${json['artworks'][0]['url']}';
    // O tamanho "t_1080p" é a melhor qualidade disponível para banners
    urlBanner = urlBanner.replaceAll('t_thumb', 't_1080p'); 
  }

  return Jogos(
    id: json['id'] ?? 0,
    nome: json['name'] ?? 'Sem Nome',
    capa: urlCapa,
    banner: urlBanner, // Agora carrega a arte oficial do jogo!
    plataforma: nomesPlataformas,
    descricao: json['summary'] ?? 'Sem descrição disponível.',
    adquirido: false,
    jogando: false,
    zerado: false,
    );
  }
}

// Suas listas antigas continuam funcionando intactas para a Tela 2!
List<Jogos> jogosIniciais = [
  Jogos(
    nome: "Hollow Knight: Silksong (2025)", 
    capa: "https://cdn2.steamgriddb.com/thumb/352b19056ce934568b956d68cbcde3b5.jpg",
    banner: "https://cdn2.steamgriddb.com/hero_thumb/23f811e37729965843d2906bda3eb947.jpg",
    lojas: [steam, epicGames],
    descricao: "Lorem Ipsum is simply dummy text of the printing...", 
    adquirido: false,
    jogando: false,
    zerado: false
  ),
  // (Pode manter o resto dos seus jogos falsos aqui embaixo normalmente)
];

List<Jogos> meusJogos = [
  Jogos(
    nome: "Persona 3 Reload (2024)", 
    capa: "https://cdn2.steamgriddb.com/thumb/a0937945c8169d3a9b8b35134274fd99.jpg",
    banner: "https://cdn2.steamgriddb.com/hero_thumb/915464a6b655320681a2a2557623a88c.jpg", 
    lojas: [xboxStore],
    descricao: "Lorem Ipsum is simply dummy text...", 
    adquirido: true,
    jogando: false,
    zerado: true
  ),
  // (Pode manter o resto dos seus jogos falsos aqui embaixo normalmente)
];