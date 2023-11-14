import 'package:donate_flutter/models/categoria_model.dart';

class Beneficiario {
  final int id;
  final String email;
  final String senha;
  final List<String> images;
  final Categoria categoria;
  final String nome;
  final String pix;

  Beneficiario({
      required this.id,
      required this.email,
      required this.senha,
      required this.images,
      required this.categoria,
      required this.nome,
      required this.pix
    });

  factory Beneficiario.fromJson(Map<String, dynamic> json) {
    List<String> imgs = (json['images'] as List<dynamic>).cast<String>();

    return Beneficiario(
        id: json['id'] as int,
        email: json['email'] as String, 
        senha: json['senha'] as String,
        images: imgs,
        categoria: Categoria.fromJson(json['categoria']),
        nome: json['nome'] as String,
        pix: json['pix'] as String
    );
  }
}