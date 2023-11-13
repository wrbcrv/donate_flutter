class Categoria {
  final int id;
  final String label;

  Categoria({
    required this.id, 
    required this.label
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'], 
      label: json['label']
    );
  }
}