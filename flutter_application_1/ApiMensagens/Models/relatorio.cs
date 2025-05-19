namespace ApiMensagens.Models
{
    public class Relatorio
    {
        public int Id { get; set; }
        public string Tipo { get; set; }
        public string Quantidade { get; set; }
        public DateTime DataRegistro { get; set; } = DateTime.Now;
    }
}
