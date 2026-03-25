import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RegistroGustosScreen extends StatefulWidget {
  const RegistroGustosScreen({super.key});

  @override
  State<RegistroGustosScreen> createState() => _RegistroGustosScreenState();
}

class _RegistroGustosScreenState extends State<RegistroGustosScreen> {
  // 1. Estado para el Presupuesto
  double _currentBudget = 150000;

  // 2. Estado para la lista de gustos (Dinámica)
  final Map<String, bool> _gustos = {
    "Comida Rápida": false,
    "Comida Saludable": false,
    "Cine": false,
    "Parque": false,
  };

  final Color purpleTheme = const Color(0xFF6A5AE0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "PlanAPP",
          style: TextStyle(color: Color(0xFF6A5AE0), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6A5AE0)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: purpleTheme,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Configura tus gustos",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Selecciona tus gustos:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            // 3. Lista de gustos generada dinámicamente
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: _gustos.keys.map((String key) {
                  return _buildCheckItem(key, _gustos[key]!, purpleTheme);
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),
            Text(
              "Presupuesto máximo: \$${_currentBudget.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} COP",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 4. Slider Dinámico (150k a 1.5M)
            Slider(
              value: _currentBudget,
              min: 150000,
              max: 1500000,
              divisions: 27, // Pasos de 50.000 en 50.000 aprox.
              activeColor: purpleTheme,
              inactiveColor: Colors.grey.shade300,
              label: _currentBudget.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentBudget = value;
                });
              },
            ),
           
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("150.000", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("1.500.000+", style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN GUARDAR
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí puedes ver los datos capturados en consola
                    print("Presupuesto: $_currentBudget");
                    print("Gustos: $_gustos");
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleTheme,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Guardar",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar actualizado para manejar el cambio de estado
  Widget _buildCheckItem(String title, bool val, Color color) {
    return CheckboxListTile(
      value: val,
      onChanged: (bool? newValue) {
        setState(() {
          _gustos[title] = newValue ?? false;
        });
      },
      title: Text(title, style: const TextStyle(fontSize: 14)),
      activeColor: color,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}