import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  final bool isDarkMode;

  const ConfiguracoesPage({super.key, required this.isDarkMode});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  // Controladores para os campos de texto
  final TextEditingController clienteController = TextEditingController();
  final TextEditingController servidorController = TextEditingController();
  final TextEditingController portaController = TextEditingController();
  final TextEditingController bdClinicaController = TextEditingController();
  final TextEditingController integracaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2),
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(color: Colors.white)), // Título da página
        backgroundColor: widget.isDarkMode ? const Color(0xFF1A2C38) : const Color(0xFF0C4474),
        iconTheme: const IconThemeData(color: Colors.white), // Ícones do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slot: Cliente (Código)
            const Text(
              'Cliente (Código):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10), // Espaçamento
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
              child: TextField(
                controller: clienteController,
                decoration: const InputDecoration(
                  hintText: 'Digite o código do cliente',
                  hintStyle: TextStyle(color: Colors.white70), // Cor do texto de dica
                  border: InputBorder.none, // Remove a borda padrão
                  contentPadding: EdgeInsets.all(16), // Espaçamento interno
                ),
                style: const TextStyle(color: Colors.white), // Cor do texto digitado
              ),
            ),
            const SizedBox(height: 20), // Espaçamento

            // Slot: Servidor
            const Text(
              'Servidor:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: servidorController,
                decoration: const InputDecoration(
                  hintText: 'Digite o endereço do servidor',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Slot: Porta
            Text(
              'Porta:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : const Color.fromARGB(255, 255, 255, 255), // Corrigi as cores para melhor contraste
                  ),
                ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: portaController,
                decoration: InputDecoration( // Remove const aqui para permitir cores dinâmicas
                  hintText: 'Digite a porta',
                  hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 20),


            // Slot: BD Clínica
            Text(
              'BD Clínica:',
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
                controller: bdClinicaController,
                decoration: InputDecoration(
                  hintText: 'Digite o nome do banco de dados',
                  hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 20),

            // Integração - agora com tema dinâmico
            Text(
              'Integração:',
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
                controller: integracaoController,
                decoration: InputDecoration(
                  hintText: 'Digite as informações de integração',
                  hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black54),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: TextStyle(color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(height: 30),


            // Botão para salvar as configurações
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação ao salvar as configurações
                  salvarConfiguracoes();
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
          ],
        ),
      ),
    );
  }

  // Função para salvar as configurações
  void salvarConfiguracoes() {
    // Recupera os valores dos campos de texto
    String cliente = clienteController.text;
    String servidor = servidorController.text;
    String porta = portaController.text;
    String bdClinica = bdClinicaController.text;
    String integracao = integracaoController.text;

    // Exibe os valores no console (ou salva em um banco de dados, por exemplo)
    print('Cliente: $cliente');
    print('Servidor: $servidor');
    print('Porta: $porta');
    print('BD Clínica: $bdClinica');
    print('Integração: $integracao');

    // Exibe uma mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Configurações salvas com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    // Limpa os controladores quando a página for fechada
    clienteController.dispose();
    servidorController.dispose();
    portaController.dispose();
    bdClinicaController.dispose();
    integracaoController.dispose();
    super.dispose();
  }
}