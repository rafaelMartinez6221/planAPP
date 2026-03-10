import 'package:flutter/material.dart';

class DetalleLugarScreen extends StatelessWidget {
  const DetalleLugarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleTheme,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: const [
          Icon(Icons.star, color: Colors.yellow, size: 30),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del lugar
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: const Icon(Icons.restaurant, size: 100, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Restaurante Italiano",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("Pizza, Italiana \$\$", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.orange, size: 20))),
                      const SizedBox(width: 10),
                      const Text("4.5 (520 Opinions)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text("Calle 10 #25 - Abierto hasta las 22:00hrs", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  const Text(
                    "Auténtica comida italiana con ingredientes frescos y excelente ambiente para compartir.",
                    style: TextStyle(color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: purpleTheme),
                      SizedBox(width: 10),
                      Text("Calle 10 #25, Ciudad Ejemplo"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: purpleTheme),
                      SizedBox(width: 10),
                      Text("Abierto hasta las 22:00hrs"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleTheme,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                      child: const Text("Ver Mapa", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}