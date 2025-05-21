using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;

public class ApiKeyMiddleware
{
    private readonly RequestDelegate _next;
    private readonly string _apiKeyConfigurada;
    private const string APIKEY_HEADER_NAME = "X-API-KEY";

    public ApiKeyMiddleware(RequestDelegate next, IConfiguration configuration)
    {
        _next = next;
        _apiKeyConfigurada = configuration["ApiKeySettings:ApiKey"];
    }

    public async Task InvokeAsync(HttpContext context)
    {
        if (!context.Request.Headers.TryGetValue(APIKEY_HEADER_NAME, out var extractedApiKey))
        {
            context.Response.StatusCode = 401; // Não autorizado
            await context.Response.WriteAsync("Chave de API não fornecida.");
            return;
        }

        if (!_apiKeyConfigurada.Equals(extractedApiKey))
        {
            context.Response.StatusCode = 403; // Proibido
            await context.Response.WriteAsync("Chave de API inválida.");
            return;
        }

        await _next(context);
    }
}
