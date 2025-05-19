namespace ApiMensagens.Models
{
    public class Mensagem
    {
        public int Id { get; set; }
        public string Parametro { get; set; }
        public string Conteudo { get; set; }
        public DateTime DataCriacao { get; set; } = DateTime.Now;
    }
}
