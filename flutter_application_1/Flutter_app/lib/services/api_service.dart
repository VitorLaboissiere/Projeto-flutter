import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://localhost:5123/api/mensageria'; // coloque o IP se for real (ex: 192.168.0.100)

  static const String _apiKey = 'SUA_CHAVE_AQUI';

  static Future<List<dynamic>> getMensagens() async {
    final response = await http.get(
      Uri.parse("$_baseUrl/mensagens"),
      headers: {
        "Content-Type": "application/json",
        "X-API-KEY": _apiKey,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar mensagens');
    }
  }

  // Aqui você pode adicionar POST, PUT, DELETE, etc.
}
