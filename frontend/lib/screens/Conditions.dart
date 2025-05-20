import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'contactVend.dart'; // Assurez-vous que ce fichier existe et est correctement lié

// Définition des couleurs de votre application
class AppColors {
  static const primary = Color(0xFF18B4BC); // Votre couleur verte/turquoise principale
  static const secondary = Color(0xFF0E8C93);
  static const link = Color(0xFF33A097);
}

class ConditionsPage extends StatefulWidget {
  const ConditionsPage({Key? key}) : super(key: key);

import 'produit.dart'; // Import du fichier produit.dart

import 'contactVend.dart';

class ConditionsPage extends StatefulWidget {
  const ConditionsPage({super.key});
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

  @override
  State<ConditionsPage> createState() => _ConditionsPageState();
}

class _ConditionsPageState extends State<ConditionsPage> {
  // Déclarations des contrôleurs et des recognizers
  final TapGestureRecognizer _cookiePolicyRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _iabProvidersRecognizer = TapGestureRecognizer();
  final ScrollController _scrollController = ScrollController();

  bool _showMoreConditions = false; // Pour contrôler l'affichage du texte "Lire la suite"

  // Contenu caché pour "Lire la suite"
  final String _hiddenConditions = '''
Utiliser des données de géolocalisation précises.
Analyser activement les caractéristiques
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
''';

  @override
  void initState() {
    super.initState();

    // Il est recommandé d'assigner des actions aux recognizers ici si vous voulez qu'ils soient cliquables.
    // Exemple :
    // _cookiePolicyRecognizer.onTap = () {
    //   _showCustomDialog(context, "Politique de cookies", "Contenu détaillé de la politique de cookies...");
    // };
    // _iabProvidersRecognizer.onTap = () {
    //   _showCustomDialog(context, "Fournisseurs IAB", "Liste détaillée des fournisseurs IAB...");
    // };
=======
    _cookiePolicyRecognizer.onTap = () => _showCookiePolicy(context);
    _iabProvidersRecognizer.onTap = () => _showIABProviders(context);
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
  }

  @override
  void dispose() {
    // Toujours disposer les contrôleurs et recognizers pour éviter les fuites de mémoire
=======
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
    _cookiePolicyRecognizer.dispose();
    _iabProvidersRecognizer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    // Calcul des dimensions réactives basées sur la taille de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.05;
    final verticalPadding = screenHeight * 0.02;
    // Les tailles fixes peuvent être ajustées ici si besoin
    final titleFontSize = 16.0;
    final bodyFontSize = 14.0;
    final logoHeight = screenHeight * 0.07;
    // Ces valeurs sont utilisées pour les boutons, basées sur les dimensions de l'écran
    final buttonWidth = screenWidth * 0.9; // 90% de la largeur de l'écran
    final buttonHeight = 49.0; // Hauteur fixe pour les boutons
    final buttonBorderRadius = 3.39; // Rayon de bordure fixe

    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc de la page
      body: SafeArea( // Assure que le contenu n'est pas sous les barres de statut/navigation du système
        child: Column(
          children: [
            SizedBox(height: verticalPadding * 1.4), // Espacement en haut
            Center(child: Image.asset('assets/logo.png', height: logoHeight)), // Logo centré
            Expanded( // Permet au contenu de défiler si nécessaire
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: verticalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alignement du texte à gauche
                    children: [
                      _buildTitle("Votre vie privée nous tient à cœur :", fontSize: 15),
                      SizedBox(height: verticalPadding * 0.8),
                      _buildRichTextWithLink(
                        textBeforeLink:
                            "Nous et nos partenaires stockons et/ou accédons à des informations sur un appareil, telles que des identifiants uniques dans des cookies pour traiter personnelles. ",
                        linkText: " cookie Politique ",
                        recognizer: _cookiePolicyRecognizer,
                        fontSize: 15,
                      ),
                      SizedBox(height: verticalPadding * 1.2),
                      _buildTitle("Nous et nos partenaires traitons des données pour fournir :", fontSize: 15),
                      SizedBox(height: verticalPadding / 3),
                      SizedBox(height: verticalPadding * 0.7),
                      _buildRichTextWithLink(
                        textBeforeLink: "Utiliser des données de géolocalisation précises Analyser activement les caractéristiques Stocker et/ou accéder à des informations sur un appareil Annonces et contenus personnalisés, mesure des annonces et du contenu, connaissance de l'audience et développement de produits",
                        linkText: "Liste des fournisseurs de l'IAB",
                        recognizer: _iabProvidersRecognizer,
                        fontSize: 15,
                      ),
                      SizedBox(height: verticalPadding / 2),
                      // Affiche le texte caché si _showMoreConditions est vrai
                      if (_showMoreConditions)
                        Padding(
                          padding: EdgeInsets.only(top: verticalPadding / 2),
                          child: Text(
                            _hiddenConditions,
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.grey,
                              height: 1.4,
                              fontFamily: 'Circular Std',
                            ),
                          ),
                        ),
                      // Bouton "Lire la suite"
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showMoreConditions = !_showMoreConditions; // Inverse l'état
                          });
                          // Scrolle vers le bas si le texte s'étend pour que l'utilisateur puisse le voir
                          if (_showMoreConditions) {
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            });
<<<<<<< HEAD
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              "Lire la suite",
                              style: TextStyle(
                                color: const Color(0xFF18B4BC), // Couleur du lien Lire la suite
                                decoration: TextDecoration.underline,
                                fontSize: bodyFontSize,
                                fontFamily: 'Circular Std',
                              ),
                            ),
                            Icon(
                              _showMoreConditions ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Change l'icône selon l'état
                              color: const Color(0xFF18B4BC),
                              size: bodyFontSize * 1.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.5), // Petit espace
                    ],
                  ),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                ),
              ),
            ),
          ],
        ),
      ),
<<<<<<< HEAD
      // Section des boutons en bas de l'écran
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 29, right: 29, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // S'assure que le Column ne prend que l'espace nécessaire à ses enfants
          children: [
            // Bouton "J'accepte" (avec dégradé)
            _buildGradientButton(
              text: "J'accepte",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ContactVend()), // Navigation vers ContactVend
                );
              },
              width: buttonWidth, // Utilise la largeur calculée
              height: buttonHeight, // Utilise la hauteur calculée
              fontSize: 13.57,
              borderRadius: 3.39, // Utilise le rayon de bordure calculé
            ),
            SizedBox(height: 12), // Espace entre les deux boutons
            // Bouton "Non, prenez-moi aux paramètres" (avec bordure)
            _buildOutlinedButton(
              text: "Non, prenez-moi aux paramètres",
              onPressed: () {
                // Action à exécuter lorsque ce bouton est pressé
                // Par exemple :
                // _showCustomDialog(context, "Paramètres", "Ceci est la page des paramètres...");
              },
              width:buttonWidth , // Utilise la largeur calculée
              height:buttonHeight, // Utilise la hauteur calculée
              fontSize: 13.57,
              borderRadius: 3.39, // Utilise le rayon de bordure calculé
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD

  // --- Widgets personnalisés ---

  // Widget pour les titres
  Widget _buildTitle(String text, {double fontSize = 16.0}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Circular Std',
      ),
    );
  }

  // Widget pour les textes avec un lien cliquable
  Widget _buildRichTextWithLink({
    required String textBeforeLink,
    required String linkText,
    required GestureRecognizer recognizer,
    double fontSize = 14,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.grey[700],
          height: 1.4,
          fontFamily: 'Circular Std',
        ),
        children: [
          TextSpan(text: textBeforeLink),
          TextSpan(
            text: linkText,
            style: TextStyle(
              color: AppColors.link, // Couleur du lien
              decoration: TextDecoration.underline, // Souligne le lien
              fontSize: fontSize,
              fontFamily: 'Circular Std',
            ),
            recognizer: recognizer,
          ),
        ],
      ),
    );
  }

  // Widget pour le texte avec dégradé (non utilisé actuellement dans le layout)
  Widget _buildGradientText(String text, {double fontSize = 14}) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color.fromARGB(255, 235, 239, 240)], // Couleurs du dégradé de texte
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          height: 1.4,
          fontFamily: 'Circular Std',
        ),
      ),
    );
  }

  // Widget pour le bouton avec dégradé (le bouton "J'accepte")
  Widget _buildGradientButton({
    required String text,
    required VoidCallback onPressed,
    double width = double.infinity,
    double height = 48,
    double fontSize = 16,
    double borderRadius = 8,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // La couleur de fond du bouton est gérée par le dégradé de l'Ink.
          // Il est important de ne PAS définir un backgroundColor ici.
          shadowColor: Colors.transparent,
          elevation: 0,  // Retire l'ombre par défaut de l'ElevatedButton
          padding: EdgeInsets.zero, // Assure que le child (Ink) prend tout l'espace
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Ink( // Ink est utilisé pour appliquer le dégradé
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/accept.png'), // Chemin vers votre image
              fit: BoxFit.cover, // Ajuste l'image pour couvrir toute la zone du bouton
            ),
            //gradient: const LinearGradient(
              // Couleurs du dégradé, ajustées pour correspondre à votre image
              //colors: [Color.fromARGB(255, 15, 133, 139), Color.fromARGB(255, 24, 180, 188)],
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
            //),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center( // Centre le texte à l'intérieur du dégradé
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white, // Texte en blanc
                fontWeight: FontWeight.bold, // Texte en gras pour une meilleure lisibilité
                fontSize: 13.57,
                fontFamily: 'Circular Std',
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget pour le bouton avec bordure (le bouton "Non, prenez-moi aux paramètres")
  Widget _buildOutlinedButton({
    required String text,
    required VoidCallback onPressed,
    double width = double.infinity,
    double height = 48,
    double fontSize = 16,
    double borderRadius = 3.39,
    double borderWidth = 1.5,
  }) {
    return SizedBox(
      width: width, // Utilise la largeur passée en paramètre
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white, // Fond du bouton en blanc
          // Définition de la bordure : couleur verte (AppColors.primary) et épaisseur
          side: BorderSide(color: AppColors.primary, width: borderWidth),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primary, // Texte en vert (AppColors.primary)
            fontWeight: FontWeight.w600, // Texte semi-gras
            fontSize: 13.57,
            fontFamily: 'Circular Std',
          ),
        ),
      ),
    );
  }

  // Fonction pour afficher un dialogue personnalisé (utilisé pour les liens par exemple)
  void _showCustomDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontFamily: 'Circular Std')),
        content: SingleChildScrollView(
          child: Text(content, style: const TextStyle(fontSize: 14, fontFamily: 'Circular Std')),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Fermer", style: TextStyle(fontFamily: 'Circular Std')),
          ),
        ],
      ),
    );
  }
}
=======
}
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
