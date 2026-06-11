using GameHub.Api.Domain;

namespace GameHub.Api.Application.Ports;

public interface IJogoRepository
{
    Task<List<Jogo>> BuscarTodosAsync();
    Task<Jogo?> BuscarPorIdAsync(int id);
    Task SalvarAsync(Jogo jogo);
    Task RemoverAsync(Jogo jogo);
}
