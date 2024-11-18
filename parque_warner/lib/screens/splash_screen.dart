import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

// Pantalla de bienvenida con una imagen, un logo y el CircularProgressIndicator
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar a la pantalla principal después de 3 segundos
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cambia el color de fondo si deseas
      body: Stack(
        fit: StackFit.expand, // Asegura que la imagen cubra toda la pantalla
        children: [
          // Imagen de fondo
          FittedBox(
            fit: BoxFit.cover, // Asegura que la imagen cubra toda la pantalla
            child: Image.asset('assets/images/main_image.png'), // Ruta de tu imagen de bienvenida
          ),
          // Logo encima de la imagen
          Positioned(
            top: 50, // Ajusta la posición vertical del logo (más cerca de la parte superior)
            left: 0, // Esto alinea el logo al centro horizontal
            right: 0, // Esto asegura que el logo esté centrado
            child: Center(
              child: Image.asset(
                'assets/images/warner-beach-logo.png', // Ruta del logo
                width: 250, // Tamaño del logo
                height: 250, // Tamaño adicional si lo necesitas
              ),
            ),
          ),
          // Indicador de carga centrado
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Puedes cambiar el color
            ),
          ),
        ],
      ),
    );
  }
}
