using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ApiMensagens.Data;
using ApiMensagens.Models;

namespace ApiMensagens.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MensageriaController : ControllerBase
    {
        private readonly AppDbContext _db;

        public MensageriaController(AppDbContext db) => _db = db;

        /* ------------  MENSAGENS  ------------ */

        [HttpPost("mensagem")]
        public async Task<IActionResult> EnviarMensagem([FromBody] Mensagem msg)
        {
            _db.Mensagens.Add(msg);
            await _db.SaveChangesAsync();
            return CreatedAtAction(nameof(ObterMensagem), new { id = msg.Id }, msg);
        }

        [HttpGet("mensagem/{id:int}")]
        public async Task<ActionResult<Mensagem>> ObterMensagem(int id)
            => await _db.Mensagens.FindAsync(id) is Mensagem m ? Ok(m) : NotFound();

        [HttpGet("mensagens")]
        public async Task<IEnumerable<Mensagem>> ListarMensagens()
            => await _db.Mensagens.OrderByDescending(m => m.DataCriacao).ToListAsync();

        /* ------------  RELATÓRIOS  ------------ */

        [HttpPost("relatorio")]
        public async Task<IActionResult> CriarRelatorio([FromBody] Relatorio rel)
        {
            _db.Relatorios.Add(rel);
            await _db.SaveChangesAsync();
            return CreatedAtAction(nameof(ObterRelatorio), new { id = rel.Id }, rel);
        }

        [HttpGet("relatorio/{id:int}")]
        public async Task<ActionResult<Relatorio>> ObterRelatorio(int id)
            => await _db.Relatorios.FindAsync(id) is Relatorio r ? Ok(r) : NotFound();

        [HttpGet("relatorios")]
        public async Task<IEnumerable<Relatorio>> ListarRelatorios()
            => await _db.Relatorios.OrderByDescending(r => r.DataRegistro).ToListAsync();

        /* ------------  ATUALIZAÇÕES  ------------ */

        [HttpPut("atualizacao/{id:int}")]
        public async Task<IActionResult> AtualizarStatus(int id, [FromBody] Atualizacao up)
        {
            if (id != up.Id) return BadRequest();
            _db.Entry(up).State = EntityState.Modified;
            await _db.SaveChangesAsync();
            return NoContent();
        }

        [HttpGet("atualizacao/{id:int}")]
        public async Task<ActionResult<Atualizacao>> ObterAtualizacao(int id)
            => await _db.Atualizacoes.FindAsync(id) is Atualizacao u ? Ok(u) : NotFound();

        [HttpGet("atualizacoes")]
        public async Task<IEnumerable<Atualizacao>> ListarAtualizacoes()
            => await _db.Atualizacoes.ToListAsync();
            // Endpoint interno para futura integração
        [HttpPost("/int/enqueueMessageToSend")]
        public IActionResult EnfileirarMensagem()
        {
            // Endpoint preparado para uso futuro
            return Ok("Endpoint /int/enqueueMessageToSend disponível.");
        }

    }
}
