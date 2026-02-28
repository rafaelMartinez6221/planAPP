import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- ONDAS INFERIORES ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 180),
              painter: BottomWavePainter(),
            ),
          ),

          // --- CONTENIDO PRINCIPAL ---
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      // --- LOGO CREADO CON ICONOS (Igual al diseño) ---
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 100,
                              color: Color(0xFF6A5AE0),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: const Icon(
                                Icons.star,
                                size: 35,
                                color: Color(0xFFFFCC00), // Amarillo de la estrella
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 10),

                      // TÍTULO
                      const Text(
                        "PlanAPP",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A5AE0),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // --- CAMPO VISUAL: CORREO ---
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.check_box, color: Color(0xFF6A5AE0)),
                            const SizedBox(width: 10),
                            Text(
                              "Correo Electrónico",
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // --- CAMPO VISUAL: CONTRASEÑA ---
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.lock_outline, color: Color(0xFF6A5AE0)),
                            const SizedBox(width: 10),
                            Text(
                              "Contraseña",
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(Icons.visibility_off, color: Colors.grey, size: 20),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // --- BOTÓN VISUAL: INICIAR SESIÓN ---
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6A5AE0),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6A5AE0).withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // --- TEXTO INFERIOR VISUAL ---
                      Column(
                        children: const [
                          Text(
                            "¿No tienes cuenta?",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Regístrate",
                            style: TextStyle(
                              color: Color(0xFF6A5AE0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
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
}


class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xFF6A5AE0).withOpacity(0.15)
      ..style = PaintingStyle.fill;
    var path1 = Path();
    path1.moveTo(0, size.height * 0.5);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.2, size.width * 0.5, size.height * 0.6);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 1.0, size.width, size.height * 0.3);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();
    canvas.drawPath(path1, paint1);

    var paint2 = Paint()
      ..color = const Color(0xFF6A5AE0).withOpacity(0.3)
      ..style = PaintingStyle.fill;
    var path2 = Path();
    path2.moveTo(0, size.height * 0.8);
    path2.quadraticBezierTo(size.width * 0.3, size.height * 1.2, size.width * 0.7, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.9, size.height * 0.3, size.width, size.height * 0.6);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}