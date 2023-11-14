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
    final BeneficiarioService beneficiarioService = BeneficiarioService();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Beneficiários'),
        ),
        body: FutureBuilder<List<Beneficiario>>(
          future: beneficiarioService.fetch(),
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
                        // Usar ListView.builder para exibir várias imagens
                        SizedBox(
                          height: 256,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: beneficiario.images.length,
                            itemBuilder: (context, imgIndex) {
                              String image = beneficiario.images[imgIndex];
                              return Image.network(
                                beneficiarioService
                                    .getUrlImage(image.replaceAll("'", "")),
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text('Erro ao carregar imagem.');
                                },
                                width: 256, // Ajuste conforme necessário
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
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
