import 'package:flutter/material.dart';
// Importamos las tres pantallas para que estén disponibles
import 'package:planapp/screens/login_screen.dart';
import 'package:planapp/screens/register_screen.dart';
import 'package:planapp/screens/planes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6A5AE0),
      ),
      // Usamos un PageView para que puedas ver las 3 pantallas al ejecutar
      home: const AllScreensPreview(), 
    );
  }
}

class AllScreensPreview extends StatelessWidget {
  const AllScreensPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          LoginScreen(),    // Desliza para ver
          RegisterScreen(), // Desliza para ver
          PlanesScreen(),   // Desliza para ver
        ],
      ),
    );
  }
}