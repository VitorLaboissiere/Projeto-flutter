import 'package:flutter/material.dart';

class FilasPage extends StatefulWidget {
  final bool isDarkMode;
  const FilasPage({super.key, required this.isDarkMode});

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

  // ignore: non_constant_identifier_names
  void SalvarFilas() {
    final filasConfig =
        _controllers.map((key, controller) => MapEntry(key, controller.text));
    print('Filas salvas: $filasConfig');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filas salvas com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2),
      appBar: AppBar(
        title: const Text('Filas', style: TextStyle(color: Colors.white)),
        backgroundColor:
            widget.isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configure as filas:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _controllers.keys.map((label) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 170,
                          child: Text(
                            label,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 47,
                          height: 40,
                          child: TextField(
                            controller: _controllers[label],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(10),
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
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: SalvarFilas,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Salvar Filas',
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
