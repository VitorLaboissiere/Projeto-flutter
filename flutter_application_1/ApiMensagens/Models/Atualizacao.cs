namespace ApiMensagens.Models
{
    public class Atualizacao
    {
        public int Id { get; set; } 
        public int? MensagemId { get; set; }
        public int? RelatoriosId { get; set; }
        public string StatusMensagem { get; set; }
        public string StatusRelatorio { get; set; }
        public DateTime UltimaAtualizacao { get; set; } = DateTime.Now;
    }
}
