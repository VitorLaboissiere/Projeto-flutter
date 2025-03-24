import 'package:flutter/material.dart';

class FilasPage extends StatefulWidget {
  @override
  _FilasPageState createState() => _FilasPageState();
}

class _FilasPageState extends State<FilasPage> {
  final Map<String, TextEditingController> _controllers = {
    'Fila Agendamento:': TextEditingController(),
    'Fila Aniversariante:': TextEditingController(),
    'Fila Pós atendimento:': TextEditingController(),
    'Fila Avaliação:': TextEditingController(),
    'Fila Cobrança:': TextEditingController(),
    'Fila Re-Cobrança: ': TextEditingController(),
    'Fila Confirmação:': TextEditingController(),
  };

  final Map<String, FocusNode> _focusNodes = {}; // Mapa para armazenar o foco de cada caixa

  @override
  void initState() {
    super.initState();
    // Inicializando o FocusNode para cada campo
    _controllers.forEach((key, value) {
      _focusNodes[key] = FocusNode();
    });
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    _focusNodes.values.forEach((focusNode) => focusNode.dispose());
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4, // Menor espaço entre as colunas
                mainAxisSpacing: 4, // Menor espaço entre as linhas
                childAspectRatio: 12, // Caixa mais compacta
                children: _controllers.keys.map((label) {
                  return GestureDetector(
                    onTap: () {
                      // Quando o usuário clica na caixa, o foco é atribuído ao campo de texto correspondente
                      FocusScope.of(context).requestFocus(_focusNodes[label]);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4), // Menos padding para deixar menor
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 12, color: Colors.white), // Texto menor
                            ),
                          ),
                          const SizedBox(width: 4), // Menor espaço entre o texto e o campo de entrada
                          SizedBox(
                            width: 45, // Caixa de texto menor
                            child: TextField(
                              controller: _controllers[label],
                              focusNode: _focusNodes[label], // Associando o FocusNode ao campo de texto
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 4), // Menor padding dentro da caixa de texto
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final filasConfig = _controllers.map((key, controller) => MapEntry(key, controller.text));
                  print('Configurações Salvas: $filasConfig');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Botão menor
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
