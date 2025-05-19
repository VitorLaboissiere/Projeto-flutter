using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using ApiMensagens.Data;
using Microsoft.EntityFrameworkCore;

public class ApiKeyMiddleware
{
    private readonly RequestDelegate _next;
    private const string APIKEY_HEADER_NAME = "X-API-KEY";

    public ApiKeyMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context, AppDbContext db)
    {
        if (!context.Request.Headers.TryGetValue(APIKEY_HEADER_NAME, out var extractedApiKey))
        {
            context.Response.StatusCode = 401;
            await context.Response.WriteAsync("Chave de API não fornecida.");
            return;
        }

        var apiKeyValida = await db.ApiKey.AnyAsync(k => k.Chave == extractedApiKey && k.Ativo);

        if (!apiKeyValida)
        {
            context.Response.StatusCode = 403;
            await context.Response.WriteAsync("Chave de API inválida.");
            return;
        }

        await _next(context);
    }
}
