using Microsoft.EntityFrameworkCore;
using ApiMensagens.Models;

namespace ApiMensagens.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options) {}
        public DbSet<Mensagem> Mensagens { get; set; }
        public DbSet<Relatorio> Relatorios { get; set; }
        public DbSet<Atualizacao> Atualizacoes { get; set; }
    }
}
