import 'package:flutter/material.dart';

class FilasPage extends StatelessWidget {
  const FilasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6084A2), // Cor de fundo da tela
      appBar: AppBar(
        title: const Text('Filas', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0C4474), // Cor do AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Ícones do AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila de mensagens agendadas
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Mensagens Agendadas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 5',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Fila de mensagens em andamento
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Mensagens em Andamento',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 3',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Fila de mensagens concluídas
            Card(
              color: Colors.white.withOpacity(0.1),
              child: const ListTile(
                title: Text(
                  'Mensagens Concluídas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  'Total: 50',
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