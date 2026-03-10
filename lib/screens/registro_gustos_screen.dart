import 'package:flutter/material.dart';

class RegistroGustosScreen extends StatelessWidget {
  const RegistroGustosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Color(0xFF6A5AE0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlanAPP", style: TextStyle(color: purpleTheme, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
            const Text("Selecciona tus gustos:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            _buildCheckItem("Comida Rápida", true, purpleTheme),
            _buildCheckItem("Comida Saludable", true, purpleTheme),
            _buildCheckItem("Cine", true, purpleTheme),
            _buildCheckItem("Parque", true, purpleTheme),
            const SizedBox(height: 25),
            const Text("Presupuesto máximo:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Slider(
              value: 150, min: 10, max: 200,
              activeColor: purpleTheme,
              inactiveColor: Colors.grey.shade300,
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("10"), Text("200")],
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleTheme,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Guardar", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(String title, bool val, Color color) {
    return CheckboxListTile(
      value: val,
      onChanged: (v) {},
      title: Text(title, style: const TextStyle(fontSize: 14)),
      activeColor: color,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}