import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos para la lista de opciones
    final List<Map<String, dynamic>> options = [
      {'icon': Icons.store, 'title': 'Tienda'},
      {'icon': Icons.directions, 'title': 'Cómo llegar'},
      {'icon': Icons.schedule, 'title': 'Horario de apertura'},
      {'icon': Icons.miscellaneous_services, 'title': 'Otros servicios'},
    ];

    // Datos para los botones de categorías
    final List<Map<String, dynamic>> categories = [
      {'title': 'Atracciones', 'imagePath': 'assets/images/atraccion-warner-agua.jpg'},
      {'title': 'Restaurantes', 'imagePath': 'assets/images/restaurante-parque-warner-beach.jpg'},
      {'title': 'Mapa', 'imagePath': 'assets/images/mapa-parque-warner-beach.jpg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 3 + options.length, // Encabezado, Categorías y Opciones
        itemBuilder: (context, index) {
          if (index == 0) {
            // Encabezado
            return _buildHeader();
          } else if (index == 1) {
            // Botones de categorías (Primera fila)
            return _buildCategoryRow(categories.sublist(0, 2));
          } else if (index == 2) {
            // Botón de categorías (Segunda fila)
            return _buildCategoryRow(categories.sublist(2));
          } else {
            // Opciones de lista
            final option = options[index - 3];
            return _buildOptionListTile(option['icon'], option['title']);
          }
        },
      ),
    );
  }

  // Método para construir el encabezado
  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  Image.asset(
                    'assets/images/warner-beach-logo.png',
                    width: 150,
                    height: 80,
                  ),
                  const Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.search, color: Colors.white),
                      label: const Text(
                        'Buscar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.rocket, color: Colors.white),
                      label: const Text(
                        'Mis entradas',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Método para construir una fila de categorías
  Widget _buildCategoryRow(List<Map<String, dynamic>> categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    category['imagePath'],
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Método para construir una lista de opciones
  Widget _buildOptionListTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.black),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              // Acción cuando se selecciona una opción
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
