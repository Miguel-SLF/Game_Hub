// implementação dos casos de uso, núcleo da aplicação sem dependência de framework

using GameHub.Api.Application.Ports;
using GameHub.Api.Domain;

namespace GameHub.Api.Application.Services;

public class JogoService : IJogoService
{
    private readonly IJogoRepository _repository;

    public JogoService(IJogoRepository repository)
    {
        _repository = repository;
    }

    public Task<List<Jogo>> ListarTodosAsync()
    {
        return _repository.BuscarTodosAsync();
    }

    public async Task<List<Jogo>> ListarMeusJogosAsync()
    {
        var jogos = await _repository.BuscarTodosAsync();
        return jogos.Where(j => j.Adquirido).ToList();
    }

    public Task<Jogo?> BuscarPorIdAsync(int id)
    {
        return _repository.BuscarPorIdAsync(id);
    }

    public async Task<Jogo> SalvarStatusAsync(Jogo jogo)
    {
        var existente = await _repository.BuscarPorIdAsync(jogo.Id);

        // se nenhum status ficou ativo, remove o registro para não acumular lixo no banco
        if (!jogo.Adquirido && !jogo.Jogando && !jogo.Zerado)
        {
            if (existente != null)
            {
                await _repository.RemoverAsync(existente);
            }
            return jogo;
        }

        if (existente == null)
        {
            await _repository.SalvarAsync(jogo);
            return jogo;
        }

        // atualiza os dados e os status do jogo já salvo
        existente.Nome = jogo.Nome;
        existente.Capa = jogo.Capa;
        existente.Banner = jogo.Banner;
        existente.Plataforma = jogo.Plataforma;
        existente.Descricao = jogo.Descricao;
        existente.Adquirido = jogo.Adquirido;
        existente.Jogando = jogo.Jogando;
        existente.Zerado = jogo.Zerado;

        await _repository.SalvarAsync(existente);
        return existente;
    }
}
