import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> enviarMensagem(String parametro, String conteudo) async {
  final url = Uri.parse('http://localhost:5000/api/mensagens');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'parametro': parametro,
      'conteudo': conteudo,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Mensagem enviada com sucesso!');
  } else {
    print('Erro ao enviar: ${response.statusCode}');
  }
}
