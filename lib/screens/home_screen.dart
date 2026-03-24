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
        elevation: 0,
        // BOTÓN ATRÁS: Ahora funcional
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Recomendaciones", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Aquí podrías agregar lógica de búsqueda más adelante
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildPlaceCard(context, "Restaurante Italiano", "Pizza, Italiana \$\$", "500m", "assets/pizza.jpg"),
          const SizedBox(height: 15),
          _buildPlaceCard(context, "Cine Central", "Cine, películas \$\$", "1.2km", "assets/cine.jpg"),
          const SizedBox(height: 15),
          _buildPlaceCard(context, "Parque Norte", "Naturaleza, aire libre", "2.0km", "assets/parque.jpg"),
        ],
      ),
    );
  }

  // MÉTODO PARA LAS TARJETAS CON NAVEGACIÓN
  Widget _buildPlaceCard(BuildContext context, String title, String sub, String dist, String img) {
    return InkWell(
      onTap: () {
        // Navegamos a la pantalla de detalle de Jesús
        Navigator.pushNamed(context, '/detalle_lugar');
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Simulación de imagen
            Container(
              height: 140, 
              width: double.infinity,
              color: Colors.grey.shade200, 
              child: const Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey)
              )
            ),
            ListTile(
              title: Text(
                title, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
              ),
              subtitle: Text(sub),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.directions_walk, size: 20, color: Color(0xFF6A5AE0)),
                  const SizedBox(height: 4),
                  Text(dist, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
