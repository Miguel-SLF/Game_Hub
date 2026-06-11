using GameHub.Api.Application.Ports;
using GameHub.Api.Domain;
using Microsoft.AspNetCore.Mvc;

namespace GameHub.Api.Adapters.Controller;

[ApiController]
[Route("api/jogos")]
public class JogosController : ControllerBase
{
    private readonly IJogoService _service;

    public JogosController(IJogoService service) => _service = service;

    [HttpGet]
    public async Task<IActionResult> ListarTodos() =>
        Ok(await _service.ListarTodosAsync());

    [HttpGet("meus")]
    public async Task<IActionResult> ListarMeus() =>
        Ok(await _service.ListarMeusJogosAsync());

    [HttpGet("{id:int}")]
    public async Task<IActionResult> BuscarPorId(int id)
    {
        var jogo = await _service.BuscarPorIdAsync(id);
        return jogo != null ? Ok(jogo) : NotFound();
    }

    [HttpPut("{id:int}")]
    public async Task<IActionResult> SalvarStatus(int id, Jogo jogo)
    {
        jogo.Id = id;
        return Ok(await _service.SalvarStatusAsync(jogo));
    }
}