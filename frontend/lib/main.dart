import 'package:flutter/material.dart';
import 'login_page.dart';


void main() => runApp(const OhVetApp());

class OhVetApp extends StatelessWidget {
  const OhVetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oh!vet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular Std',
        primaryColor: const Color(0xFF05485D),
      ),
      home: const LoginPage(),
    );
  }
}