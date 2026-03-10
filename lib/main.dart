import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/registro_gustos_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detalle_lugar_screen.dart';
import 'screens/favoritos_screen.dart';
import 'screens/planes_screen.dart';

void main() => runApp(const PlanAppMaster());

class PlanAppMaster extends StatelessWidget {
  const PlanAppMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlanAPP Final',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      // PARA PROBAR CADA VISTA: Cambia la clase en 'home'
      home: const FavoritosScreen(), 
      
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/gustos': (context) => const RegistroGustosScreen(),
        '/home': (context) => const HomeScreen(),
        '/detalle': (context) => const DetalleLugarScreen(),
        '/favoritos': (context) => const FavoritosScreen(),
        '/planes': (context) => const PlanesScreen(),
      },
    );
  }
}
