import 'package:flutter/material.dart';
import 'mensagens_page.dart'; // Importe a página de Mensagens
import 'configuracoes_page.dart';
import 'relatorios_page.dart';
import 'filas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6084A2), // Cor de fundo da tela
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isSidebarOpen ? 250 : 0,
                color: const Color(0xFF0C4474), // Cor do sidebar
                child: isSidebarOpen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50), // Espaçamento no topo do menu
                          menuButton("Mensagens", Icons.message),
                          menuButton("Configurações", Icons.settings),
                          menuButton("Relatórios", Icons.analytics),
                          menuButton("Filas", Icons.queue),
                        ],
                      )
                    : null,
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
                      color: Colors.white.withOpacity(0.1), // Fundo semi-transparente
                      borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                    ),
                    margin: const EdgeInsets.all(20), // Margem externa
                    padding: const EdgeInsets.all(20), // Espaçamento interno
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/imagemmm.png', // Caminho da imagem
                          width: 300, // Largura da imagem
                          height: 300, // Altura da imagem
                          fit: BoxFit.contain, // Ajuste da imagem
                        ),
                        const SizedBox(height: 30), // Espaçamento
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
          backgroundColor: Colors.white.withOpacity(0.1), // Fundo semi-transparente
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50), // Altura fixa
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          ),
        ),
        onPressed: () {
          if (title == "Mensagens") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MensagensPage()),
            );
          } else if (title == "Configurações") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ConfiguracoesPage()),
            );
          } else if (title == "Relatórios") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RelatoriosPage()),
            );
          } else if (title == "Filas") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FilasPage()),
            );
          }
        },     
        child: Row(
          children: [
            Icon(icon, color: Colors.white), // Ícone do botão
            const SizedBox(width: 10), // Espaçamento entre ícone e texto
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar botões de ação no centro
  Widget actionButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0C4474), // Cor do botão
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50), // Mesma altura que os botões do menu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          ),
          elevation: 5, // Sombra do botão
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white), // Ícone do botão
            const SizedBox(width: 10), // Espaçamento entre ícone e texto
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}