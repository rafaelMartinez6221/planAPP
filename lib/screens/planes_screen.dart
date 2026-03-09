import 'package:flutter/material.dart';

class PlanesScreen extends StatelessWidget {
  const PlanesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: purpleTheme),
        title: const Text(
          "PLANES",
          style: TextStyle(color: purpleTheme, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Ondas de fondo
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 150),
              painter: BottomWavePainter(),
            ),
          ),
          
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Elige el plan que se adapta a ti",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 30),

                // TARJETA PREMIUM (FREE)
                _buildPlanCard(
                  title: "PREMIUM",
                  tag: "FREE POPULAR",
                  items: [
                    "Crear tareas",
                    "Calendario básico",
                    "Recordatorios normales",
                    "Sin Inteligencia Artificial",
                  ],
                  isPopular: false,
                ),

                const SizedBox(height: 25),

                // TARJETA MÁS POPULAR
                _buildPlanCard(
                  title: "MÁS POPULAR",
                  tag: "★ MÁS POPULAR",
                  price: "\$19,900 / mes",
                  items: [
                    "Todo lo del plan Free",
                    "Generación automática de planes",
                    "Recomendaciones inteligentes",
                    "Optimización de horarios",
                    "Asistente con IA",
                  ],
                  isPopular: true,
                  buttonText: "Suscribirme",
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String tag,
    required List<String> items,
    required bool isPopular,
    String? price,
    String? buttonText,
  }) {
    const Color purpleTheme = Color(0xFF6A5AE0);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isPopular ? purpleTheme : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
        ],
        border: isPopular ? null : Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header de la tarjeta
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: isPopular ? Colors.white.withOpacity(0.2) : Colors.orange.shade100,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            child: Text(
              tag,
              style: TextStyle(
                color: isPopular ? Colors.white : Colors.orange.shade800,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isPopular ? Colors.white : purpleTheme,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: isPopular ? Colors.white : Colors.green, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        item,
                        style: TextStyle(color: isPopular ? Colors.white : Colors.black87),
                      ),
                    ],
                  ),
                )),
                
                if (price != null) ...[
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      price,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],

                if (buttonText != null) ...[
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: purpleTheme,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ],
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
    var paint = Paint()..color = const Color(0xFF6A5AE0).withOpacity(0.1)..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.2, size.width * 0.6, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.9, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}