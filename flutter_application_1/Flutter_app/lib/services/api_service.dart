import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = '/int/enqueueMessageToSend'; // coloque o IP se for real (ex: 192.168.0.100)
  static const String _apiKey = 'SUA_CHAVE_AQUI';

  // Método existente para buscar mensagens
  static Future<List<dynamic>> getMensagens() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/mensagens"),
      headers: {
        "Content-Type": "application/json",
        "X-API-KEY": _apiKey,
      },
    );
    if (response.statusCode == 200) {
        print('Status: ${response.statusCode}');
        print('Body: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar mensagens');
    }
  }

  // Novo método para enviar mensagem com todos os parâmetros necessários
  static Future<void> enviarMensagem({
    required String queueId,
    required String apiKey,
    required String number,
    required String clientId,
    required String text,
    required bool hidden,
  }) async {
    final response = await http.post(
      Uri.parse(_baseUrl), // Note que mantive _baseUrl conforme seu endpoint
      headers: {
        "Content-Type": "application/json",
        "X-API-KEY": _apiKey, // Usando a chave da classe ou a recebida por parâmetro?
      },
      body: jsonEncode({
        "queueId": queueId,
        "apiKey": apiKey, // Se usar a chave da classe, remova esta linha
        "number": number,
        "clientId": clientId,
        "text": text,
        "hidden": hidden,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao enviar mensagem: ${response.body}');
    }
  }
}