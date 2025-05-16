import 'package:flutter/material.dart';
import 'screens/inscription.dart';
import 'screens/signup_page.dart';
import 'screens/login_page.dart';
import 'screens/contactVend.dart';

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
        '/signup_page': (context) => const SignUpPage(),
        '/login_page': (context) => const LoginPage(),
      },
    );
  }
}
