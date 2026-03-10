import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleTheme,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        title: const Text("Recomendaciones", style: TextStyle(color: Colors.white)),
        actions: const [Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.search, color: Colors.white))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildPlaceCard("Restaurante Italiano", "Pizza, Italiana \$\$", "500m", "assets/pizza.jpg"),
          const SizedBox(height: 15),
          _buildPlaceCard("Cine Central", "Cine, películas \$\$", "1.2km", "assets/cine.jpg"),
          const SizedBox(height: 15),
          _buildPlaceCard("Parque Norte", "Naturaleza, aire libre", "2.0km", "assets/parque.jpg"),
        ],
      ),
    );
  }

  Widget _buildPlaceCard(String title, String sub, String dist, String img) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(height: 120, color: Colors.grey.shade300, child: const Center(child: Icon(Icons.image, size: 50))),
          ListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(sub),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.directions_walk, size: 18, color: Colors.grey),
                Text(dist, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
