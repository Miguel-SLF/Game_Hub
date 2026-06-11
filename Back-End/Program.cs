using GameHub.Api.Adapters.Persistence;
using GameHub.Api.Application.Ports;
using GameHub.Api.Application.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<GameHubDbContext>(options =>
    options.UseSqlite("Data Source=gamehub.db"));

builder.Services.AddScoped<IJogoRepository, SqliteJogoRepository>();
builder.Services.AddScoped<IJogoService, JogoService>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
        policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

builder.Services.AddControllers();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var context = scope.ServiceProvider.GetRequiredService<GameHubDbContext>();
    context.Database.EnsureCreated();
}

app.UseCors();

app.MapControllers();

app.Run();