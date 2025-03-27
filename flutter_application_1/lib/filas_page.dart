import 'package:flutter/material.dart';

class FilasPage extends StatefulWidget {
  const FilasPage({Key? key}) : super(key: key);

  @override
  State<FilasPage> createState() => FilasPageState();
}

class FilasPageState extends State<FilasPage> {
  final Map<String, TextEditingController> _controllers = {
    'Fila Agendamento:': TextEditingController(),
    'Fila Aniversariante:': TextEditingController(),
    'Fila Pós Atendimento:': TextEditingController(),
    'Fila Avaliação:': TextEditingController(),
    'Fila Cobrança:': TextEditingController(),
    'Fila Re-Cobrança:': TextEditingController(),
    'Fila Confirmação:': TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {};

  @override
  void initState() {
    super.initState();
    for (final key in _controllers.keys) {
      _focusNodes[key] = FocusNode();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filas', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0C4474),
      ),
      backgroundColor: const Color(0xFF6084A2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configure as filas:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            // Column para alinhar as caixas de mensagem uma embaixo da outra
            Expanded(
              child: ListView(
                children: _controllers.keys.map((label) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        // Rótulo da fila
                        SizedBox(
                          width: 200, // Define o tamanho fixo para o texto
                          child: Text(
                            label,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 6), // Espaço entre o texto e o campo de entrada
                        
                        // Caixa de texto compacta
                        SizedBox(
                          width: 35, // Define o tamanho fixo para o campo de texto
                          child: TextField(
                            controller: _controllers[label],
                            focusNode: _focusNodes[label],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final filasConfig = _controllers.map((key, controller) => MapEntry(key, controller.text));
                  print('Configurações Salvas: $filasConfig');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Salvar Configurações', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
