# 🎮 Game Hub

Aplicativo Flutter para descobrir e gerenciar jogos, consumindo a API do IGDB, com um back-end em C# (arquitetura hexagonal) que armazena a biblioteca do usuário em um banco SQLite.

## 📱 Funcionalidades

- Listagem de jogos em alta (nota > 85, mais de 500 avaliações)
- Pesquisa de jogos pelo nome
- Tela de detalhe com banner, capa, plataformas e descrição
- Biblioteca pessoal com status de cada jogo (Adquirido, Jogando, Zerado)
- Status salvos no banco de dados pelo back-end (persistem após fechar o app)
- Navegação entre telas via Bottom Navigation Bar

## 🗂️ Estrutura de Arquivos

### Front-end (`Game_Hub/`)
```
lib/
├── main.dart                  # Ponto de entrada do app
├── game_hub.dart              # Widget raiz / MaterialApp
├── jogos.dart                 # Model de Jogo
├── tela_principal.dart        # Tela home com lista de jogos em alta
├── tela_meus_jogos.dart       # Tela da biblioteca do usuário
├── tela_detalhe_jogo.dart     # Tela de detalhe de cada jogo
├── lista_jogos.dart           # Widget da lista de jogos com pesquisa
├── lista_meus_jogos.dart      # Widget da lista da biblioteca
└── services/
    ├── api_service.dart       # Comunicação com a API do IGDB
    └── backend_service.dart   # Comunicação com o back-end (status dos jogos)
```

### Back-end (`back-end/`)
```
├── Program.cs                          # Composição da aplicação (DI, CORS, banco)
├── Domain/
│   └── Jogo.cs                         # Entidade de domínio
├── Application/
│   ├── Ports/
│   │   ├── IJogoService.cs             # Porta de entrada (casos de uso)
│   │   └── IJogoRepository.cs          # Porta de saída (persistência)
│   └── Services/
│       └── JogoService.cs              # Implementação dos casos de uso
└── Adapters/
    ├── Http/
    │   └── JogosEndpoints.cs           # Adaptador de entrada (REST)
    └── Persistence/
        ├── GameHubDbContext.cs         # Contexto do EF Core
        └── SqliteJogoRepository.cs     # Adaptador de saída (SQLite)
```

## 🔌 APIs

### IGDB

O app utiliza a [IGDB API](https://api-docs.igdb.com/) para buscar os jogos.

Os jogos em alta seguem os seguintes critérios:
- Nota maior que 85
- Mais de 500 avaliações
- Com capa e artwork disponíveis
- Ordenados por popularidade

A pesquisa busca pelo nome digitado, retornando apenas jogos com capa.

### Back-end (porta 5025)

| Método | Rota | Descrição |
|---|---|---|
| `GET` | `/api/jogos` | Lista todos os jogos com algum status salvo |
| `GET` | `/api/jogos/meus` | Lista apenas os jogos adquiridos |
| `GET` | `/api/jogos/{id}` | Busca o status de um jogo específico |
| `PUT` | `/api/jogos/{id}` | Cria ou atualiza o status de um jogo |

Se todos os status de um jogo ficarem falsos, o registro é removido do banco automaticamente.

## 📦 Dependências

### Front-end
| Pacote | Uso |
|---|---|
| `http` | Requisições às APIs (IGDB e back-end) |
| `cached_network_image` | Carregamento de imagens com cache |

### Back-end
| Pacote | Uso |
|---|---|
| `Microsoft.EntityFrameworkCore.Sqlite` | Persistência no banco SQLite |

## 🚀 Como rodar

1. Clone o repositório
2. Suba o back-end (requer .NET 9):
```bash
   cd back-end
   dotnet run
```
   A API sobe em `http://localhost:5025` e o banco (`gamehub.db`) é criado automaticamente na primeira execução.
3. Em outro terminal, instale as dependências do app:
```bash
   cd Game_Hub
   flutter pub get
```
4. Rode o app:
```bash
   flutter run
```

## ⚠️ Observações

- As credenciais da API do IGDB (Client ID e Token) estão diretamente no `api_service.dart`. Para produção, o ideal é movê-las para variáveis de ambiente.
- No emulador Android o app acessa o back-end pelo IP `10.0.2.2` automaticamente. Em um celular físico, troque o endereço no `backend_service.dart` pelo IP da sua máquina na rede local.
- Se o back-end estiver desligado, o app continua funcionando: a home carrega normalmente, apenas sem os status salvos.
