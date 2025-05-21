import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mensagens API',
      home: Scaffold(
        appBar: AppBar(title: const Text('Mensagens')),
        body: FutureBuilder(
          future: ApiService.getMensagens(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else {
              final mensagens = snapshot.data as List;
              return ListView.builder(
                itemCount: mensagens.length,
                itemBuilder: (context, index) {
                  final m = mensagens[index];
                  return ListTile(
                    title: Text(m['conteudo'] ?? 'Sem conteúdo'),
                    subtitle: Text(m['parametro'] ?? ''),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
