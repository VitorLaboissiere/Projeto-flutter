import 'package:flutter/material.dart';

class MensagensPage extends StatefulWidget {
  const MensagensPage({super.key});

  @override
  State<MensagensPage> createState() => _MensagensPageState();
}

class _MensagensPageState extends State<MensagensPage> {
  String? _parametroSelecionado; // Variável para armazenar a opção selecionada
  final List<String> _parametros = [
    'Selecione', // Opção padrão
    'Agendamento',
    'Pós Agendamento',
    'Reagendamento',
    'Avaliação',
    'Aniversário',
    'Cobrança',
    'Re-Cobrança',
  ];

  final TextEditingController _mensagemController = TextEditingController(); // Controlador para o campo de texto
  String _mensagemSalva = ''; // Variável para armazenar a mensagem salva

  @override
  void dispose() {
    _mensagemController.dispose(); // Libera o controlador quando o widget for descartado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6084A2), // Cor de fundo da tela
      appBar: AppBar(
        title: const Text('Mensagens', style: TextStyle(color: Colors.white)), // Título da página
        backgroundColor: const Color(0xFF0C4474), // Cor do AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Ícones do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção de seleção de parâmetros
            const Text(
              'Selecione o parâmetro:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10), // Espaçamento
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Fundo semi-transparente
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: _parametroSelecionado,
                hint: const Text('Selecione', style: TextStyle(color: Colors.white70)),
                dropdownColor: const Color(0xFF0C4474), // Cor do dropdown
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                isExpanded: true, // Expande o dropdown para ocupar a largura disponível
                onChanged: (String? novoValor) {
                  setState(() {
                    _parametroSelecionado = novoValor; // Atualiza a opção selecionada
                  });
                },
                items: _parametros.map<DropdownMenuItem<String>>((String valor) {
                  return DropdownMenuItem<String>(
                    value: valor,
                    child: Text(
                      valor,
                      style: const TextStyle(color: Colors.white), // Cor do texto das opções
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Botão "OK"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_parametroSelecionado != null && _parametroSelecionado != 'Selecione') {
                    // Ação ao pressionar o botão "OK"
                    print('Parâmetro selecionado: $_parametroSelecionado');
                  } else {
                    // Mostrar mensagem de erro se nenhum parâmetro for selecionado
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecione um parâmetro válido!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C4474), // Cor do botão
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30), // Espaçamento maior
            // Caixa de texto para escrever a mensagem
            const Text(
              'Digite sua mensagem:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10), // Espaçamento
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Fundo semi-transparente
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
              child: TextField(
                controller: _mensagemController,
                decoration: const InputDecoration(
                  hintText: 'Digite sua mensagem aqui...', // Texto de dica
                  hintStyle: TextStyle(color: Colors.white70), // Cor do texto de dica
                  border: InputBorder.none, // Remove a borda padrão
                  contentPadding: EdgeInsets.all(16), // Espaçamento interno
                ),
                style: const TextStyle(color: Colors.white), // Cor do texto digitado
                maxLines: 5, // Permite múltiplas linhas de texto
              ),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Botão "SALVAR"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final mensagem = _mensagemController.text; // Captura o texto digitado
                  if (mensagem.isNotEmpty) {
                    setState(() {
                      _mensagemSalva = mensagem; // Atualiza a mensagem salva
                    });
                    print('Mensagem salva: $mensagem');
                  } else {
                    // Mostrar mensagem de erro se o campo estiver vazio
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Digite uma mensagem antes de salvar!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor do botão
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                  ),
                ),
                child: const Text(
                  'SALVAR',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento
            // Exibe a mensagem salva
            if (_mensagemSalva.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), // Fundo semi-transparente
                  borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                ),
                child: Text(
                  'Mensagem salva: $_mensagemSalva',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}