import 'package:flutter/material.dart';

class RelatoriosPage extends StatefulWidget {
  final bool isDarkMode;

  const RelatoriosPage({super.key, required this.isDarkMode});

  @override
  State<RelatoriosPage> createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? const Color(0xFF2C3E50) : const Color(0xFF6084A2),
      appBar: AppBar(
        title: const Text('Relatórios', style: TextStyle(color: Colors.white)),
        backgroundColor: widget.isDarkMode ? const Color(0xFF1A2C38) : const Color(0xFF0C4474),
        iconTheme: const IconThemeData(color: Colors.white), // Ícones do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Relatório de mensagens enviadas
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Mensagens Enviadas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 120',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Relatório de mensagens entregues
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Mensagens Entregues',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 110',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Relatório de falhas
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Falhas no Envio',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 10',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}