import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // FONDO DE ONDAS
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 180),
              painter: BottomWavePainter(),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      // LOGO
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(Icons.location_on, size: 100, color: Color(0xFF6A5AE0)),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: const Icon(Icons.star, size: 30, color: Color(0xFFFFCC00)),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 10),
                      const Text(
                        "PlanAPP",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF6A5AE0)),
                      ),

                      const SizedBox(height: 40),

                      // CAMPOS DE TEXTO (Usando tu función _buildField)
                      _buildField(Icons.person_outline, "Nombre"),
                      const SizedBox(height: 15),
                      _buildField(Icons.check_box_outlined, "Correo Electrónico"),
                      const SizedBox(height: 15),
                      _buildField(Icons.lock_outline, "Contraseña", isPassword: true),

                      const SizedBox(height: 35),

                      // BOTÓN REGISTRARSE -> Navega a la pantalla de Gustos (Migue)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/gustos');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6A5AE0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Registrarse",
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // RETORNO AL LOGIN -> Navega de vuelta al Login
                      const Text("¿Ya tienes cuenta?", style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Inicia Sesión",
                          style: TextStyle(color: Color(0xFF6A5AE0), fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET AUXILIAR PARA LOS CAMPOS
  Widget _buildField(IconData icon, String hint, {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6A5AE0), size: 22),
          const SizedBox(width: 12),
          Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 15)),
          if (isPassword) ...[
            const Spacer(),
            const Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 20),
          ]
        ],
      ),
    );
  }
}

// PAINTER PERSONALIZADO
class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = const Color(0xFF6A5AE0).withOpacity(0.2)..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.5, size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 1.1, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter old) => false;
}