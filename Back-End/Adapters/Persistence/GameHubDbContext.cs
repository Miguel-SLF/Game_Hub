// contexto do EF Core que mapeia a entidade Jogo para o banco SQLite

using GameHub.Api.Domain;
using Microsoft.EntityFrameworkCore;

namespace GameHub.Api.Adapters.Persistence;

public class GameHubDbContext : DbContext
{
    public GameHubDbContext(DbContextOptions<GameHubDbContext> options) : base(options)
    {
    }

    public DbSet<Jogo> Jogos => Set<Jogo>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // o id vem da IGDB, então não é gerado pelo banco
        modelBuilder.Entity<Jogo>()
            .Property(j => j.Id)
            .ValueGeneratedNever();
    }
}
