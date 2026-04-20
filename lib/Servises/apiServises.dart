import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_response.dart';
import '../models/usuario.dart'; // ¡Aquí llamamos a tu modelo de Usuario!

class ApiService {
  // IP para el emulador de Android
  static const String baseUrl = 'http://10.0.2.2:8080/api';
  
  // Guardamos el Token JWT
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // ==========================================
  // FUNCIÓN DE LOGIN
  // ==========================================
  Future<AuthResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(jsonDecode(response.body));
      await _saveToken(authResponse.token);
      return authResponse;
    } else {
      throw Exception('Error al iniciar sesión: Revisa tus datos');
    }
  }

  // ==========================================
  // FUNCIÓN DE REGISTRO
  // ==========================================
  Future<AuthResponse> register(String nombre, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombre,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final authResponse = AuthResponse.fromJson(jsonDecode(response.body));
      await _saveToken(authResponse.token);
      return authResponse;
    } else {
      throw Exception('Error en el registro');
    }
  }

  // ==========================================
  // NUEVO: OBTENER DATOS DEL USUARIO
  // ==========================================
  Future<Usuario> getPerfilUsuario() async {
    // 1. Buscamos el token guardado en el celular
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('No has iniciado sesión');
    }

    // 2. Le pedimos al backend los datos del usuario usando ese token de permiso
    final response = await http.get(
      Uri.parse('$baseUrl/usuarios/me'), // Asegúrate que el profe tenga una ruta parecida
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Aquí le mandamos la llave de acceso
      },
    );

    // 3. Convertimos la respuesta de Java a nuestro modelo Usuario de Flutter
    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar el perfil del usuario');
    }
  }

  // Cerrar sesión
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}