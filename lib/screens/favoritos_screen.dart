import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // BOTÓN ATRÁS: Útil si el usuario llega desde el detalle de un lugar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Favoritos", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        actions: const [
          Icon(Icons.search, color: purpleTheme), 
          SizedBox(width: 15)
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildFavItem(context, "Restaurante Italiano", "Pizza, Italiana \$\$", "assets/pizza.jpg"),
          const SizedBox(height: 15),
          _buildFavItem(context, "Cine Central", "Cine, películas \$\$", "assets/cine.jpg"),
        ],
      ),
      // NAVBAR INFERIOR: Navegación entre secciones principales
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Mantiene los iconos estables
        selectedItemColor: purpleTheme,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Índice 2 es 'Favoritos'
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
          // Puedes agregar más rutas aquí (Perfiles, Tienda, etc.)
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: 'Planes'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  // MÉTODO PARA LOS ITEMS CON NAVEGACIÓN AL DETALLE
  Widget _buildFavItem(BuildContext context, String title, String desc, String img) {
    return InkWell(
      onTap: () {
        // Permite volver a ver el detalle desde favoritos
        Navigator.pushNamed(context, '/detalle_lugar');
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Container(
            width: 50, 
            height: 50, 
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(desc),
          trailing: const Icon(Icons.star, color: Colors.orange),
        ),
      ),
    );
  }
}