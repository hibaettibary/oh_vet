import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'inscription.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'produit.dart';
=======
import 'screens/inscription.dart';
import 'screens/signup_page.dart';
import 'screens/login_page.dart';
import 'screens/contactVend.dart';
>>>>>>> 61323f768455b1d6af1011c1c220bfe22d63fe6f

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
      home: const InscriptionPage(),
      routes: {
<<<<<<< HEAD
         '/signup': (context) => const SignUpPage(),
         '/login': (context) => const LoginPage(),
         '/produit': (context) => ProduitApp(),  // sans const
},
=======
        '/signup_page': (context) => const SignUpPage(),
        '/login_page': (context) => const LoginPage(),
      },
>>>>>>> 61323f768455b1d6af1011c1c220bfe22d63fe6f
    );
  }
}
