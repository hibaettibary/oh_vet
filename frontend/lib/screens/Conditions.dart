import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
<<<<<<< HEAD:frontend/lib/Conditions.dart
import 'produit.dart'; // Import du fichier produit.dart

=======
import 'contactVend.dart';
>>>>>>> 61323f768455b1d6af1011c1c220bfe22d63fe6f:frontend/lib/screens/Conditions.dart
class ConditionsPage extends StatefulWidget {
  const ConditionsPage({super.key});

  @override
  State<ConditionsPage> createState() => _ConditionsPageState();
}

class _ConditionsPageState extends State<ConditionsPage> {
  final TapGestureRecognizer _cookiePolicyRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _iabProvidersRecognizer = TapGestureRecognizer();
  final ScrollController _scrollController = ScrollController();
  bool _showFullConditions = false;

  final String _allConditions = '''
En acceptant, vous consentez également à l'utilisation de vos données à des fins de :
- Recherche et développement produit
- Amélioration continue des services
- Analyse comportementale à des fins de personnalisation

Vous pouvez retirer votre consentement à tout moment via la section des paramètres.
Pour plus de détails, veuillez consulter les documents liés à la protection des données.
''';

  @override
  void initState() {
    super.initState();
    _cookiePolicyRecognizer.onTap = () => _showCookiePolicy(context);
    _iabProvidersRecognizer.onTap = () => _showIABProviders(context);
  }

  @override
  void dispose() {
    _cookiePolicyRecognizer.dispose();
    _iabProvidersRecognizer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showCookiePolicy(BuildContext context) {
    // Logique supplémentaire si nécessaire
  }

  void _showIABProviders(BuildContext context) {
    // Logique supplémentaire si nécessaire
  }

  void _navigateToSettings(BuildContext context) {
    // Navigation vers les paramètres si nécessaire
  }

  void _goToProduitPage(BuildContext context) {
    Navigator.push(
      context,
   MaterialPageRoute(builder: (context) => ProduitApp()), // sans const
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 6, color: Colors.black),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.black))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Image.asset('assets/logo.png', height: 60),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Votre vie privée nous tient à cœur :",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
                        children: [
                          const TextSpan(
                            text:
                                "Nous et nos partenaires stockons et/ou accédons à des informations sur un appareil... ",
                          ),
                          TextSpan(
                            text: "Politique des cookies",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 51, 160, 151),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: _cookiePolicyRecognizer,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Nous et nos partenaires traitons des données pour fournir :",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint("Utiliser des données de géolocalisation précises."),
                    _buildBulletPoint("Analyser activement les caractéristiques pour l'identification."),
                    _buildBulletPoint("Stocker et/ou accéder à des informations sur un appareil."),
                    _buildBulletPoint(
                        "Annonces et contenus personnalisés, mesure des annonces et du contenu, etc."),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Liste des fournisseurs de l'IAB",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 51, 160, 151),
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: _iabProvidersRecognizer,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (!_showFullConditions)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _showFullConditions = true;
                            });
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00BFC5)),
                          label: const Text(
                            "Lire la suite",
                            style: TextStyle(
                              color: Color(0xFF00BFC5),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    if (_showFullConditions)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          _allConditions,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
<<<<<<< HEAD:frontend/lib/Conditions.dart
                onPressed: () => _goToProduitPage(context),
=======
                onPressed: () {
           
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ContactVend()),
                            );
                          },
>>>>>>> 61323f768455b1d6af1011c1c220bfe22d63fe6f:frontend/lib/screens/Conditions.dart
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/accept.png"),
                      fit: BoxFit.cover,
                    ),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF18B4BC), Color(0xFF0E8C93)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "J'accepte",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 1,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: ()=> _navigateToSettings(context),

               
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                side: const BorderSide(color: Color(0xFF18B4BC), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Non, prenez-moi aux paramètres",
                style: TextStyle(
                  color: Color(0xFF18B4BC),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
