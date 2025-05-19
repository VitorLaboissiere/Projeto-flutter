import 'package:flutter/material.dart';

class MensagensPage extends StatefulWidget {
  final bool isDarkMode;
  const MensagensPage({super.key, this.isDarkMode = false});

  @override
  State<MensagensPage> createState() => _MensagensPageState();
}

class _MensagensPageState extends State<MensagensPage> {
  String? _parametroSelecionado;
  final List<String> _parametros = [
    'Selecione',
    'Agendamento',
    'Pós Agendamento',
    'Reagendamento',
    'Avaliação',
    'Aniversário',
    'Cobrança',
    'Re-Cobrança',
  ];

  final TextEditingController _mensagemController = TextEditingController();
  String _mensagemSalva = '';

  @override
  void dispose() {
    _mensagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2),
      appBar: AppBar(
        title: const Text('Mensagens', style: TextStyle(color: Colors.white)),
        backgroundColor: widget.isDarkMode ? const Color(0xFF1A2C38) : const Color(0xFF0C4474),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione o parâmetro:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: _parametroSelecionado,
                hint: Text('Selecione', style: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black54)),
                dropdownColor: widget.isDarkMode ? const Color(0xFF1A2C38) : const Color(0xFF0C4474),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                isExpanded: true,
                onChanged: (String? novoValor) {
                  setState(() {
                    _parametroSelecionado = novoValor;
                  });
                },
                items: _parametros.map<DropdownMenuItem<String>>((String valor) {
                  return DropdownMenuItem<String>(
                    value: valor,
                    child: Text(
                      valor,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_parametroSelecionado != null && _parametroSelecionado != 'Selecione') {
                    print('Parâmetro selecionado: $_parametroSelecionado');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecione um parâmetro válido!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.isDarkMode ? const Color(0xFF1E3A5F) : const Color(0xFF0C4474),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Digite sua mensagem:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _mensagemController,
                decoration: InputDecoration(
                  hintText: 'Digite sua mensagem aqui...',
                  hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final mensagem = _mensagemController.text;
                  if (mensagem.isNotEmpty) {
                    setState(() {
                      _mensagemSalva = mensagem;
                    });
                    print('Mensagem salva: $mensagem');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Digite uma mensagem antes de salvar!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'SALVAR',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_mensagemSalva.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Mensagem salva: $_mensagemSalva',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}