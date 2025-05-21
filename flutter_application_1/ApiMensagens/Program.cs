using ApiMensagens.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Configurar banco de dados MySQL
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySQL(builder.Configuration.GetConnectionString("DefaultConnection")));

// Registrar autorização (necessário para usar app.UseAuthorization())
builder.Services.AddAuthorization();

var app = builder.Build();

// Redireciona HTTP para HTTPS
app.UseHttpsRedirection();

// Middleware de autenticação por chave de API (X-API-KEY)
app.UseMiddleware<ApiKeyMiddleware>();

// Middleware de autorização (necessário apenas se estiver usando [Authorize] em endpoints)
app.UseAuthorization();

// Exemplo de rota protegida
app.MapGet("/weatherforecast", () =>
{
    var summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    var forecast = Enumerable.Range(1, 5).Select(index =>
        new WeatherForecast
        (
            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            Random.Shared.Next(-20, 55),
            summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();

    return forecast;
})
.WithName("GetWeatherForecast");

app.Run();

record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
