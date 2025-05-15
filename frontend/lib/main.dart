import 'package:flutter/material.dart';
import 'inscription.dart';
import 'signup_page.dart';
import 'login_page.dart';

void main() => runApp(const OhVetApp());

class OhVetApp extends StatelessWidget {
  const OhVetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oh!vet',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Circular Std',
      ),
      // 👉 première page affichée
      home: const InscriptionPage(),
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
