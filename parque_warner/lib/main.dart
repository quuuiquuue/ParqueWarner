import 'package:flutter/material.dart';
import 'package:parque_warner/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Parque Warner',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

