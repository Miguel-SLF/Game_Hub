//"banco de dados fake"

class Lojas {
  String nome;
  String imagem;

  Lojas({required this.nome, required this.imagem});
}

Lojas steam = Lojas(
  nome: "Steam",
  imagem: "https://via.placeholder.com/50"
);

Lojas epicGames = Lojas(
  nome: "Epic Games",
  imagem: "https://via.placeholder.com/50"
);

Lojas xboxStore = Lojas(
  nome: "Xbox Store",
  imagem: "https://via.placeholder.com/50"
);

Lojas nintendoEshop = Lojas(
  nome: "Nintendo eShop",
  imagem: "https://via.placeholder.com/50"
);

Lojas playStationStore = Lojas(
  nome: "PlayStation Store",
  imagem: "https://via.placeholder.com/50"
);

Lojas gog = Lojas(
  nome: "GOG",
  imagem: "https://via.placeholder.com/50"
);

class Jogos {
  String nome;
  String capa;
  String banner;
  List<Lojas> lojas;
  String descricao;
  bool adquirido = false;
  bool jogando = false;
  bool zerado = false;


Jogos({
  required this.nome,
  required this.capa,
  required this.banner,
  required this.lojas,
  required this.descricao,
  required this.adquirido,
  required this.jogando,
  required this.zerado
});
}


List<Jogos> jogosIniciais = [

Jogos(
  nome: "Hollow Knight: Silksong (2025)", 
  capa: "https://cdn2.steamgriddb.com/thumb/352b19056ce934568b956d68cbcde3b5.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/23f811e37729965843d2906bda3eb947.jpg",
  lojas: [steam, epicGames],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Grand Theft Auto IV: The Complete Edition (2008)", 
  capa: "https://cdn2.steamgriddb.com/thumb/28ff0f3716be1c4b5c7f107b00bc22b8.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/ed58966527f3896422f854dc5d703513.png",
  lojas: [nintendoEshop],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "The Witcher 3: Wild Hunt (2015)", 
  capa: "https://cdn2.steamgriddb.com/thumb/2f87d717bf556321774d1b4975d2e1c1.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/63c27708f9cf591e878c155f23c25b5a.jpg",
  lojas: [steam, xboxStore, playStationStore, gog],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Dark Souls: Remastered (2018)", 
  capa: "https://cdn2.steamgriddb.com/thumb/fa09649961c5c38096ee815c1084b2f0.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/9493b40d57ad7be6c0da24d381015694.png",
  lojas: [steam, gog, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Resident Evil 3: Nemesis (1999)", 
  capa: "https://cdn2.steamgriddb.com/thumb/42ff57c8fdc6c59e71bd81ef68b62ec3.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/b856243e684b903de6085dc70830792a.jpg", 
  lojas: [xboxStore, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "We Happy Few (2018)", 
  capa: "https://cdn2.steamgriddb.com/thumb/1dd0a697c2c176adef4fa293869a93f0.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/f25a418b357e97b19bcc1a3eda1ac864.jpg", 
  lojas: [playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Persona 3 Reload (2024)", 
  capa: "https://cdn2.steamgriddb.com/thumb/a0937945c8169d3a9b8b35134274fd99.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/915464a6b655320681a2a2557623a88c.jpg", 
  lojas: [xboxStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Cuphead (2017)", 
  capa: "https://cdn2.steamgriddb.com/thumb/25dcf1554f13c36b512dfe907acc77d3.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/0f27c12b5d79ce8419764f71ac4ba499.jpg", 
  lojas: [steam, xboxStore, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Stardew Valley (2016)", 
  capa: "https://cdn2.steamgriddb.com/thumb/992fbfcd780c3f522308d44f1b13ee19.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/a606db731d30029173a3cedca5085ae9.jpg", 
  lojas: [steam, epicGames, gog],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Undertale (2015)", 
  capa: "https://cdn2.steamgriddb.com/thumb/014f6631d5840dba68d43666662e1052.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/07c0dec6e97ec77c01aa90902a3fc6b5.jpg", 
  lojas: [steam, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: "Dead by Daylight (2016)", 
  capa: "https://cdn2.steamgriddb.com/thumb/e094a58c3495647287f75da5f6a7f6f3.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/4a3e00961a08879c34f91ca0070ea2f5.jpg", 
  lojas: [steam, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

Jogos(
  nome: " Assassin's Creed IV: Black Flag (2013)", 
  capa: "https://cdn2.steamgriddb.com/thumb/73273bfc99cf06ef1cbde5663b73704b.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/3806734b256c27e41ec2c6bffa26d9e7.jpg", 
  lojas: [steam, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: false,
  jogando: false,
  zerado: false
),

];




List<Jogos> meusJogos = [

Jogos(
  nome: "Persona 3 Reload (2024)", 
  capa: "https://cdn2.steamgriddb.com/thumb/a0937945c8169d3a9b8b35134274fd99.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/915464a6b655320681a2a2557623a88c.jpg", 
  lojas: [xboxStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: false,
  zerado: true
),

Jogos(
  nome: "Dead by Daylight (2016)", 
  capa: "https://cdn2.steamgriddb.com/thumb/e094a58c3495647287f75da5f6a7f6f3.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/4a3e00961a08879c34f91ca0070ea2f5.jpg", 
  lojas: [steam, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: true,
  zerado: true
),

Jogos(
  nome: "Cuphead (2017)", 
  capa: "https://cdn2.steamgriddb.com/thumb/25dcf1554f13c36b512dfe907acc77d3.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/0f27c12b5d79ce8419764f71ac4ba499.jpg", 
  lojas: [steam, xboxStore, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: false,
  zerado: true
),


Jogos(
  nome: "Dark Souls: Remastered (2018)", 
  capa: "https://cdn2.steamgriddb.com/thumb/fa09649961c5c38096ee815c1084b2f0.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/9493b40d57ad7be6c0da24d381015694.png",
  lojas: [steam, gog, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: true,
  zerado: false
),

Jogos(
  nome: "Hollow Knight: Silksong (2025)", 
  capa: "https://cdn2.steamgriddb.com/thumb/352b19056ce934568b956d68cbcde3b5.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/23f811e37729965843d2906bda3eb947.jpg",
  lojas: [steam, epicGames],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: false,
  zerado: true
),

Jogos(
  nome: "Undertale (2015)", 
  capa: "https://cdn2.steamgriddb.com/thumb/014f6631d5840dba68d43666662e1052.jpg",
  banner: "https://cdn2.steamgriddb.com/hero_thumb/07c0dec6e97ec77c01aa90902a3fc6b5.jpg", 
  lojas: [steam, epicGames, xboxStore, nintendoEshop, playStationStore],
  descricao: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software including versions of Lorem Ipsum.", 
  adquirido: true,
  jogando: false,
  zerado: true
),

];