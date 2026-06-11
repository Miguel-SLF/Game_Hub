namespace GameHub.Api.Domain;

public class Jogo
{
    // id vindo da IGDB, usado como chave primária
    public int Id { get; set; }
    public string Nome { get; set; } = string.Empty;
    public string Capa { get; set; } = string.Empty;
    public string Banner { get; set; } = string.Empty;
    public string Plataforma { get; set; } = string.Empty;
    public string Descricao { get; set; } = string.Empty;

    // estados do jogo na biblioteca do usuário
    public bool Adquirido { get; set; }
    public bool Jogando { get; set; }
    public bool Zerado { get; set; }
}
