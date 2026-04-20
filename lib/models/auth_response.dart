class AuthResponse {
  final String token;

  AuthResponse({required this.token});

  // Convierte la respuesta del servidor (JSON) a este objeto en Flutter
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] ?? '', 
    );
  }
}