import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importez le package intl pour la mise en forme de la date et de l'heure

class ContactVend extends StatelessWidget {
  const ContactVend({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir la locale pour le français (inutile ici, la locale est définie lors du formatage)
    //final frenchLocale = const Locale('fr', 'FR');
    // Créer un formateur de devise pour le MAD (Dirham marocain)
    final currencyFormat = NumberFormat.currency(locale: 'fr_MA', symbol: 'MAD');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Retour à la page précédente
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Section Image
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'images/Article.png', // Utilisez le chemin d'accès à votre image "Article.png"
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Gestionnaire d'erreur pour le chargement de l'image
                    return const Center(child: Text('Erreur de chargement de l\'image'));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5, // Nombre d'indicateurs d'image
                      (index) => Container(
                        width: 414,
                        height: 478,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.white : Colors.grey, // Met en évidence l'image actuelle
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/50/FFC107/000000?Text=J', // Replace with seller's profile image URL
                        ),
                        radius: 15,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Jhonathan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                      const SizedBox(width:8.0),
                      const Icon(Icons.star, color: Colors.amber, size: 16.0),
                      const Text(
                        '(60)',
                        style: TextStyle(fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                      const SizedBox(width: 16.0),
                      const Text(
                        '. 50 Ventes',
                        style: TextStyle(color: Colors.grey, fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Robe douce kaki',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Inter'), // Utilisez la police Inter
                  ),
                  const Text(
                    'Vêtements',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Inter'), // Utilisez la police Inter
                  ),
                  const Text(
                    '10/L - Neuf avec étiquettes - Bershka',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Inter'), // Utilisez la police Inter
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        currencyFormat.format(150.00), // Utilisez le formatteur de devise
                        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        currencyFormat.format(220.00), // Utilisez le formatteur de devise
                        style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          // Handle plus d'info action
                        },
                        icon: const Icon(Icons.info_outline, color: Colors.grey),
                        label: const Text('Plus d\'info', style: TextStyle(color: Colors.grey, fontFamily: 'Inter')), // Utilisez la police Inter
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle contacter vendeur action
                        _showContactDialog(context); // Afficher la boîte de dialogue personnalisée
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontFamily: 'Inter'), // Utilisez la police Inter
                      ),
                      child: const Text('CONTACTER VENDEUR'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Handle favoriser action
                        },
                        icon: const Icon(Icons.favorite_border, color: Colors.red),
                        label: const Text('Favorisé', style: TextStyle(color: Colors.black87, fontFamily: 'Inter')), // Utilisez la police Inter
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Handle partager action
                        },
                        icon: const Icon(Icons.share_outlined, color: Colors.grey),
                        label: const Text('Partager', style: TextStyle(color: Colors.black87, fontFamily: 'Inter')), // Utilisez la police Inter
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher la boîte de dialogue personnalisée
  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contacter le vendeur', style: TextStyle(fontFamily: 'Inter')), // Utilisez la police Inter
          content: const Text('Vous pouvez contacter le vendeur par téléphone au 01 23 45 67 89 ou par email à vendeur@email.com.', style: TextStyle(fontFamily: 'Inter')), // Utilisez la police Inter
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer', style: TextStyle(fontFamily: 'Inter')), // Utilisez la police Inter
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Appeler', style: TextStyle(fontFamily: 'Inter')), // Utilisez la police Inter
              onPressed: () {
                // Ajoutez ici la logique pour lancer un appel téléphonique
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Envoyer un email', style: TextStyle(fontFamily: 'Inter')), // Utilisez la police Inter
              onPressed: () {
                // Ajoutez ici la logique pour envoyer un email
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

