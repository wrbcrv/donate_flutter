import 'package:donate_flutter/models/beneficiario_model.dart';
import 'package:donate_flutter/services/beneficiario_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Beneficiários'),
        ),
        body: FutureBuilder<List<Beneficiario>>(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Beneficiario beneficiario = snapshot.data![index];
                  return ListTile(
                    title: Text(beneficiario.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categoria: ${beneficiario.categoria.label}'),
                        Text('Nome: ${beneficiario.nome}')
                      ],
                    ),
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
