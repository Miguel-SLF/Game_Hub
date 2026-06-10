# 🎮 Game Hub

Aplicativo Flutter para descobrir e gerenciar jogos, consumindo a API do IGDB.

## 📱 Funcionalidades

- Listagem de jogos em alta (nota > 85, mais de 500 avaliações)
- Tela de detalhe com banner, capa, plataformas e descrição
- Biblioteca pessoal com status de cada jogo (Adquirido, Jogando, Zerado)
- Navegação entre telas via Bottom Navigation Bar

## 🗂️ Estrutura de Arquivos
lib/
├── main.dart               # Ponto de entrada do app
├── game_hub.dart           # Widget raiz / MaterialApp
├── jogos.dart              # Models de Jogo e Loja
├── tela_principal.dart     # Tela home com lista de jogos em alta
├── tela_meus_jogos.dart    # Tela da biblioteca do usuário
├── tela_detalhe_jogo.dart  # Tela de detalhe de cada jogo
├── lista_jogos.dart        # Widget da lista de jogos em alta
├── lista_meus_jogos.dart   # Widget da lista da biblioteca
└── services/
└── api_service.dart    # Comunicação com a API do IGDB

## 🔌 API

O app utiliza a [IGDB API](https://api-docs.igdb.com/) para buscar os jogos.

Os jogos retornados seguem os seguintes critérios:
- Nota maior que 85
- Mais de 500 avaliações
- Com capa e artwork disponíveis
- Ordenados por popularidade
- Limite de 15 jogos

## 📦 Dependências

| Pacote | Uso |
|---|---|
| `http` | Requisições à API do IGDB |
| `cached_network_image` | Carregamento de imagens com cache |

## 🚀 Como rodar

1. Clone o repositório
2. Instale as dependências:
```bash
   flutter pub get
```
3. Rode o app:
```bash
   flutter run
```

## ⚠️ Observações

- As credenciais da API (Client ID e Token) estão diretamente no `api_service.dart`. Para produção, o ideal é movê-las para variáveis de ambiente.
- A lista `meusJogos` é global e não persiste após fechar o app. Para persistência, considere usar `shared_preferences` ou um banco local como `sqflite`.
