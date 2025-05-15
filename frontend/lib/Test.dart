import 'package:flutter/material.dart';
import 'Inscription.dart';
import'Conditions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InscriptionPage(), // Une seule page d'accueil
      routes: {
        '/conditions': (context) => ConditionsPage(), // Définition de la route
      },
    );
  }
}