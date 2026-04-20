class Usuario {
  final int? id;
  final String name; // El profe usó 'username', lo dejamos igual para que no falle su Java
  final String email;

  Usuario({
    this.id,
    required this.name,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}