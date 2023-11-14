import 'dart:convert';

import 'package:donate_flutter/models/beneficiario_model.dart';
import 'package:http/http.dart' as http;

class BeneficiarioService {
  static const String apiUrl = 'http://localhost:8080/beneficiarios';

  String getUrlImage(String imageName) {
    return '$apiUrl/image/download/$imageName';
  }

  Future<List<Beneficiario>> fetch() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/beneficiarios'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Beneficiario> beneficiarios =
          data.map((json) => Beneficiario.fromJson(json)).toList();

      return beneficiarios;
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }
}
