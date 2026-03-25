import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  // CONTROLADORES
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        // LOGO
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              Icon(Icons.location_on, size: 100, color: Color(0xFF6A5AE0)),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Icon(Icons.star, size: 35, color: Color(0xFFFFCC00)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "PlanAPP",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A5AE0),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // EMAIL
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email, color: Color(0xFF6A5AE0)),
                            hintText: "Correo Electrónico",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingresa tu correo";
                            }
                            if (!value.contains('@')) {
                              return "Correo inválido";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // PASSWORD
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: Color(0xFF6A5AE0)),
                            hintText: "Contraseña",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingresa tu contraseña";
                            }
                            if (value.length < 6) {
                              return "Mínimo 6 caracteres";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 35),

                        // BOTÓN LOGIN
                        GestureDetector(
                          onTap: login,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6A5AE0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "Iniciar Sesión",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Column(
                          children: [
                            const Text(
                              "¿No tienes cuenta?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(
                                "Regístrate",
                                style: TextStyle(
                                  color: Color(0xFF6A5AE0),
                                  fontWeight: FontWeight.bold,
                                ),
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
          ),
        ],
      ),
    );
  }
}

// WAVE PAINTER (igual que el tuyo)
class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = const Color(0xFF6A5AE0).withOpacity(0.15)
      ..style = PaintingStyle.fill;

    var path1 = Path();
    path1.moveTo(0, size.height * 0.5);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.2,
        size.width * 0.5, size.height * 0.6);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 1.0,
        size.width, size.height * 0.3);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    canvas.drawPath(path1, paint1);

    var paint2 = Paint()
      ..color = const Color(0xFF6A5AE0).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    var path2 = Path();
    path2.moveTo(0, size.height * 0.8);
    path2.quadraticBezierTo(size.width * 0.3, size.height * 1.2,
        size.width * 0.7, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.9, size.height * 0.3,
        size.width, size.height * 0.6);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}