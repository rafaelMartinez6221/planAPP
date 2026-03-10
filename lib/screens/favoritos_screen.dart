import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Favoritos", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.search, color: purpleTheme), SizedBox(width: 15)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildFavItem("Restaurante Italiano", "Pizza, Italiana \$\$", "assets/pizza.jpg"),
          const SizedBox(height: 15),
          _buildFavItem("Cine Central", "Cine, películas \$\$", "assets/cine.jpg"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purpleTheme,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildFavItem(String title, String desc, String img) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(width: 50, height: 50, color: Colors.grey.shade200, child: const Icon(Icons.image)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.star, color: Colors.orange),
      ),
    );
  }
}