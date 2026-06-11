using GameHub.Api.Domain;

namespace GameHub.Api.Application.Ports;

public interface IJogoService
{
    Task<List<Jogo>> ListarTodosAsync();
    Task<List<Jogo>> ListarMeusJogosAsync();
    Task<Jogo?> BuscarPorIdAsync(int id);
    Task<Jogo> SalvarStatusAsync(Jogo jogo);
}
