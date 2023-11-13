import 'package:donate_flutter/models/categoria_model.dart';

class Beneficiario {
  final String email;
  final String senha;
  final String imageName;
  final Categoria categoria;
  final String nome;
  final String pix;

  Beneficiario({
      required this.email,
      required this.senha,
      required this.imageName,
      required this.categoria,
      required this.nome,
      required this.pix
    });

  factory Beneficiario.fromJson(Map<String, dynamic> json) {
    return Beneficiario(
        email: json['email'] as String, 
        senha: json['senha'] as String,
        imageName: json['imageName'] as String,
        categoria: Categoria.fromJson(json['categoria']),
        nome: json['nome'] as String,
        pix: json['pix'] as String
    );
  }
}