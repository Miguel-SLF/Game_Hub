// adaptador de entrada: expõe os casos de uso como endpoints HTTP REST

using GameHub.Api.Application.Ports;
using GameHub.Api.Domain;

namespace GameHub.Api.Adapters.Http;

public static class JogosEndpoints
{
    public static void MapJogosEndpoints(this WebApplication app)
    {
        var grupo = app.MapGroup("/api/jogos");

        // lista todos os jogos com algum status salvo
        grupo.MapGet("/", async (IJogoService service) =>
            Results.Ok(await service.ListarTodosAsync()));

        // lista apenas os jogos adquiridos (tela meus jogos)
        grupo.MapGet("/meus", async (IJogoService service) =>
            Results.Ok(await service.ListarMeusJogosAsync()));

        // busca o status de um jogo específico
        grupo.MapGet("/{id:int}", async (int id, IJogoService service) =>
        {
            var jogo = await service.BuscarPorIdAsync(id);
            return jogo != null ? Results.Ok(jogo) : Results.NotFound();
        });

        // cria ou atualiza o status de um jogo (adquirido, jogando, zerado)
        grupo.MapPut("/{id:int}", async (int id, Jogo jogo, IJogoService service) =>
        {
            jogo.Id = id;
            var salvo = await service.SalvarStatusAsync(jogo);
            return Results.Ok(salvo);
        });
    }
}
