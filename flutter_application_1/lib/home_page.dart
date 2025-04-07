import 'package:flutter/material.dart';
import 'mensagens_page.dart'; // Importe a página de Mensagens
import 'configuracoes_page.dart';
import 'relatorios_page.dart';
import 'filas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Remove o parâmetro isDarkMode aqui

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isSidebarOpen = false;
  bool isDarkMode = false; // Estado do tema agora é gerenciado aqui

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  void toggleDarkMode() { // Adicionado função para alternar o tema
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2), // Cor de fundo alterável
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar condicional para evitar erro de renderização
              if (isSidebarOpen)
                ClipRect(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSidebarOpen ? 250 : 0,
                    color: isDarkMode ? const Color(0xFF1A2C38) : const Color(0xFF0C4474), // Cor do sidebar alterável
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50), // Espaçamento no topo do menu
                        menuButton("Mensagens", Icons.message),
                        menuButton("Configurações", Icons.settings),
                        menuButton("Relatórios", Icons.analytics),
                        menuButton("Filas", Icons.queue),
                      ],
                    ),
                  ),
                ),
              // Conteúdo principal
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isSidebarOpen) {
                      setState(() {
                        isSidebarOpen = false;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/imagemmm.png',
                          width: 350,
                          height: 350,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        actionButton("Testar conexão", Icons.wifi),
                        actionButton("Enviar mensagens", Icons.send),
                        actionButton("Verificar envio de mensagens", Icons.check_circle),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Botão de menu
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.menu, size: 30, color: Colors.white),
              onPressed: toggleSidebar,
            ),
          ),
          // Botão de tema (adicionado)
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                size: 30,
                color: Colors.white,
              ),
              onPressed: toggleDarkMode,
            ),
          ),
        ],
      ),
    );
  }

  // Função para criar botões de menu lateral
  Widget menuButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode ? const Color(0xFF2C3E50) : Colors.white.withOpacity(0.1),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (title == "Mensagens") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MensagensPage(isDarkMode: isDarkMode)),
            );
          } else if (title == "Configurações") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfiguracoesPage(isDarkMode: isDarkMode)),
            );
          } else if (title == "Relatórios") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RelatoriosPage(isDarkMode: isDarkMode)),
            );
          } else if (title == "Filas") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilasPage(isDarkMode: isDarkMode)),
            );
          }
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // Função para criar botões de ação no centro
  Widget actionButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode ? const Color(0xFF1E3A5F) : const Color(0xFF0C4474),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}