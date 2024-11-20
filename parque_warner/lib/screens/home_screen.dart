import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showDownArrow = true;

  // Datos para la lista de opciones
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.store, 'title': 'Tienda'},
    {'icon': Icons.directions, 'title': 'Cómo llegar'},
    {'icon': Icons.schedule, 'title': 'Horario de apertura'},
    {'icon': Icons.auto_awesome, 'title': 'Flash Pass'},
    {'icon': Icons.beach_access_rounded, 'title': 'Zona VIP'},
    {'icon': Icons.shopping_bag, 'title': 'Tiendas de souvenirs'},
    {'icon': Icons.local_hospital, 'title': 'Primeros auxilios'},
    {'icon': Icons.local_parking, 'title': 'Parking'},
    {'icon': Icons.miscellaneous_services, 'title': 'Otros servicios'},
    {'icon': Icons.local_dining, 'title': 'Restaurantes'},
    {'icon': Icons.event, 'title': 'Eventos'},
    {'icon': Icons.camera_alt, 'title': 'Fotografía'},
  ];

  // Datos para los botones de categorías
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Atracciones',
      'imagePath': 'assets/images/atraccion-warner-agua.jpg'
    },
    {
      'title': 'Restaurantes',
      'imagePath': 'assets/images/restaurante-parque-warner-beach.jpg'
    },
    {
      'title': 'Mapa',
      'imagePath': 'assets/images/mapa-parque-warner-beach.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // Controlar la visibilidad del botón de flecha hacia abajo
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        bool isBottom = _scrollController.position.pixels == _scrollController.position.maxScrollExtent;
        setState(() {
          // Si estás en la parte inferior, oculta el botón
          _showDownArrow = !isBottom;
        });
      } else {
        setState(() {
          _showDownArrow = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // SingleChildScrollView para el contenido desplazable
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // El encabezado es fijo
                _buildHeader(),
                // Aquí colocamos las categorías
                _buildCategoryRow(categories.sublist(0, 2)), // Primera fila de categorías
                _buildCategoryRow(categories.sublist(2)), // Segunda fila de categorías
                // Lista de opciones
                ..._buildOptionList(), // Lista de opciones completa
              ],
            ),
          ),
          // Botón flotante de flecha hacia abajo
          if (_showDownArrow)
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 28, // Centrado horizontalmente
              child: FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.arrow_downward),
              ),
            ),
        ],
      ),
    );
  }

  // Método para construir el encabezado
  Widget _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
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
          Container(
            padding: const EdgeInsets.only(bottom: 13, top: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
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
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.confirmation_num_outlined,
                          color: Colors.white),
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
          ),
        ],
      ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          category['imagePath'],
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          category['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Método para construir la lista de opciones completa
  List<Widget> _buildOptionList() {
    return options
        .map((option) => _buildOptionListTile(option['icon'], option['title']))
        .toList();
  }

  // Método para construir un elemento de opción de la lista
  Widget _buildOptionListTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.black),
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
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
