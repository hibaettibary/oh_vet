import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'Conditions.dart';

class ContactVend extends StatelessWidget {
  final String sellerImageUrl =
      "https://randomuser.me/api/portraits/women/74.jpg"; // Example seller image
  final String sellerName = "Jhonathan";
  final double rating = 4.5;
  final int ratingCount = 60;
  final int salesCount = 50;
  final String articleName = "Robe douce kaki";
  final String category = "Vêtements";
  final String condition = "10/L - Neuf avec étiquettes - Bershka";
  final double price = 150.00;
  final double originalPrice = 220.00;

  @override
  Widget build(BuildContext context) {
=======
import 'package:intl/intl.dart'; // Importez le package intl pour la mise en forme de la date et de l'heure

class ContactVend extends StatelessWidget {
  const ContactVend({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir la locale pour le français (inutile ici, la locale est définie lors du formatage)
    //final frenchLocale = const Locale('fr', 'FR');
    // Créer un formateur de devise pour le MAD (Dirham marocain)
    final currencyFormat = NumberFormat.currency(locale: 'fr_MA', symbol: 'MAD');

>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
<<<<<<< HEAD
            Navigator.pop(context);
=======
            Navigator.of(context).pop(); // Retour à la page précédente
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
<<<<<<< HEAD
              // Handle more actions
=======
              // Handle more options action
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            },
          ),
        ],
      ),
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/Article.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Seller Info
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(sellerImageUrl),
                      ),
                      const SizedBox(width: 8.0),
                      Text(sellerName,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8.0),
                      Icon(Icons.star, color: Colors.amber[400], size: 16.0),
                      const SizedBox(width: 4.0),
                      Text('($ratingCount)'),
                      const SizedBox(width: 4.0),
                      Text('. $salesCount Ventes'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Article Details
                  Text(articleName,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  Text(category, style: const TextStyle(color: Colors.grey)),
                  Text(condition, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16.0),
                  // Price
                  Row(
                    children: [
                      Text('${price.toStringAsFixed(2)} MAD',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8.0),
                      Text('${originalPrice.toStringAsFixed(2)} MAD',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey)),
                      const Spacer(),
                      const Text('Plus d\'info', style: TextStyle(color: Colors.black)),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // Contact Button
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
<<<<<<< HEAD
                        // Handle contact seller action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF18B4BC),
                        foregroundColor: Colors.white,
=======
                        // Handle contacter vendeur action
                        _showContactDialog(context); // Afficher la boîte de dialogue personnalisée
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontFamily: 'Inter'), // Utilisez la police Inter
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                      ),
                      child: const Text('CONTACTER VENDEUR'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
<<<<<<< HEAD
                  // Favorite and Share Buttons
=======
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
<<<<<<< HEAD
                          // Handle favorite action
                        },
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        label: const Text('Favorisé',
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Handle share action
                        },
                        icon: const Icon(Icons.share, color: Colors.grey),
                        label: const Text('Partager',
                            style: TextStyle(color: Colors.black)),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
                      ),
                    ],
                  ),
                ],
              ),
<<<<<<< HEAD
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: ''),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
    );
  }
}

