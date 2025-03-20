import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final TextEditingController _numeroController = TextEditingController(); // Número do WhatsApp
  final TextEditingController _mensagemPadraoController = TextEditingController(); // Mensagem padrão

  @override
  void dispose() {
    _numeroController.dispose();
    _mensagemPadraoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6084A2), // Cor de fundo da tela
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0C4474), // Cor do AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Ícones do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo para número do WhatsApp
            const Text(
              'Número do WhatsApp:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(
                hintText: 'Digite o número do WhatsApp...',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            // Campo para mensagem padrão
            const Text(
              'Mensagem Padrão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _mensagemPadraoController,
              decoration: InputDecoration(
                hintText: 'Digite a mensagem padrão...',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
              style: const TextStyle(color: Colors.white),
              maxLines: 5,
            ),
            const SizedBox(height: 30),
            // Botão para salvar configurações
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final numero = _numeroController.text;
                  final mensagemPadrao = _mensagemPadraoController.text;
                  if (numero.isNotEmpty && mensagemPadrao.isNotEmpty) {
                    print('Número salvo: $numero');
                    print('Mensagem padrão salva: $mensagemPadrao');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C4474),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Salvar Configurações',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}