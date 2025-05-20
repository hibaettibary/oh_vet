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
  }

  @override
  void dispose() {
    // Toujours disposer les contrôleurs et recognizers pour éviter les fuites de mémoire
    _cookiePolicyRecognizer.dispose();
    _iabProvidersRecognizer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

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
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            });
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
                ),
              ),
            ),
          ],
        ),
      ),
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
            ),
          ],
        ),
      ),
    );
  }

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