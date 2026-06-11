using GameHub.Api.Application.Ports;
using GameHub.Api.Domain;
using Microsoft.EntityFrameworkCore;

namespace GameHub.Api.Adapters.Persistence;

public class SqliteJogoRepository : IJogoRepository
{
    private readonly GameHubDbContext _context;

    public SqliteJogoRepository(GameHubDbContext context)
    {
        _context = context;
    }

    public Task<List<Jogo>> BuscarTodosAsync()
    {
        return _context.Jogos.AsNoTracking().ToListAsync();
    }

    public Task<Jogo?> BuscarPorIdAsync(int id)
    {
        return _context.Jogos.FirstOrDefaultAsync(j => j.Id == id);
    }

    public async Task SalvarAsync(Jogo jogo)
    {
        // se o jogo ainda não está sendo rastreado pelo contexto, é um registro novo
        if (_context.Entry(jogo).State == EntityState.Detached &&
            !await _context.Jogos.AnyAsync(j => j.Id == jogo.Id))
        {
            _context.Jogos.Add(jogo);
        }

        await _context.SaveChangesAsync();
    }

    public async Task RemoverAsync(Jogo jogo)
    {
        _context.Jogos.Remove(jogo);
        await _context.SaveChangesAsync();
    }
}
