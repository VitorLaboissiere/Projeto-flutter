import 'package:flutter/material.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6084A2), // Cor de fundo da tela
      appBar: AppBar(
        title: const Text('Relatórios', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0C4474), // Cor do AppBar
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