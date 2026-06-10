// porta de entrada (driving port): casos de uso expostos para os adaptadores de entrada (HTTP)

using GameHub.Api.Domain;

namespace GameHub.Api.Application.Ports;

public interface IJogoService
{
    // todos os jogos com algum status salvo
    Task<List<Jogo>> ListarTodosAsync();

    // apenas os jogos adquiridos (biblioteca "meus jogos")
    Task<List<Jogo>> ListarMeusJogosAsync();

    Task<Jogo?> BuscarPorIdAsync(int id);

    // cria ou atualiza o status de um jogo
    Task<Jogo> SalvarStatusAsync(Jogo jogo);
}
