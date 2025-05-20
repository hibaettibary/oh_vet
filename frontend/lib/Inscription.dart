import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'login_page.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double commonBorderRadius = 3.39;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Arrière-plan avec l'image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/inscription.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Overlay semi-transparent (sauf partie haute)
            Column(
              children: [
                // Partie haute blanche (66px)
                Container(
                  height: 66,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/logo.png',
                      width: 118.17,
                      height: 40,
                    ),
                  ),
                ),

                // Overlay semi-transparent pour le reste
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 100),

                          // Sous-titre
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Vendre des vêtements d\'occasion totalement gratuitement',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'circulard std',
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 80),

                          // Bouton d'inscription
                          SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF05495E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(commonBorderRadius),
                                  side: const BorderSide(color: Color(0xFF096B68), width: 2.0),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Inscrivez-vous',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'circulard std',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Bouton de connexion existante
                          SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white, width: 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(commonBorderRadius),
                                ),
                              ),
                              child: const Text(
                                'J\'ai déjà un compte',
                                style: TextStyle(fontSize: 14,
                                fontFamily: 'circulard std',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Bouton Facebook
                          SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {
                                // Action Facebook à ajouter ici
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF425F9E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(commonBorderRadius),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'f',
                                    style: TextStyle(
                                      color: Colors.white,
                                      
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Continuer avec Facebook',
                                    style: TextStyle(
                                      fontSize: 14,
  color: Colors.white,
  fontFamily: 'circulard std',
),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Bouton Google
                          SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {
                                // Action Google à ajouter ici
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(commonBorderRadius),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/google.png',
                                    width: 18.51,
                                    height: 18.51,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Continuer avec Google',
                                    style: TextStyle(
                                      color: Color(0xFF4285F4),
                                      fontSize: 13.57,
                                      fontFamily: 'circulard std',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
