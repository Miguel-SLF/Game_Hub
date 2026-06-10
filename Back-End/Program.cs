// composição da aplicação: liga as portas aos adaptadores e sobe a API

using GameHub.Api.Adapters.Http;
using GameHub.Api.Adapters.Persistence;
using GameHub.Api.Application.Ports;
using GameHub.Api.Application.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// banco SQLite local (arquivo gamehub.db na pasta do projeto)
builder.Services.AddDbContext<GameHubDbContext>(options =>
    options.UseSqlite("Data Source=gamehub.db"));

// injeção de dependência: porta -> adaptador
builder.Services.AddScoped<IJogoRepository, SqliteJogoRepository>();
builder.Services.AddScoped<IJogoService, JogoService>();

// CORS liberado para o app Flutter acessar a API
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
        policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

var app = builder.Build();

// cria o banco e a tabela na primeira execução
using (var scope = app.Services.CreateScope())
{
    var context = scope.ServiceProvider.GetRequiredService<GameHubDbContext>();
    context.Database.EnsureCreated();
}

app.UseCors();

app.MapJogosEndpoints();

app.Run();
