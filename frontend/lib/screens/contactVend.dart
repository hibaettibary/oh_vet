import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {
              // Handle more actions
            },
          ),
        ],
      ),
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle contact seller action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF18B4BC),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('CONTACTER VENDEUR'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Favorite and Share Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {
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
                      ),
                    ],
                  ),
                ],
              ),
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
    );
  }
}

