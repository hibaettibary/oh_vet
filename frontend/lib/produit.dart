import 'package:flutter/material.dart';

void main() => runApp(ProduitApp());

class ProduitApp extends StatelessWidget {
  const ProduitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Définir la couleur d'arrière-plan ici pour l'ensemble de l'application
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: CategorySelectionPage(),
    );
  }
}

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  String selectedTab = 'Femme';

  final Map<String, List<Map<String, dynamic>>> categories = {
    'Femme': [
      {'name': 'Vêtements', 'emoji': '👚'},
      {'name': 'Chaussures', 'emoji': '👠'},
      {'name': 'Sacs', 'emoji': '👜'},
      {'name': 'Accessoires', 'emoji': '💍'},
    ],
    'Homme': [
      {'name': 'Vêtements', 'emoji': '👔'},
      {'name': 'Chaussures', 'emoji': '👞'},
      {'name': 'Accessoires', 'emoji': '⌚'},
    ],
    'Enfants': [
      {'name': 'Vêtements', 'emoji': '👕'},
      {'name': 'Jouet et Accessoires', 'emoji': '🎮'},
      {'name': 'Mobilier enfant', 'emoji': '🍼'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 251, 251),
      appBar: AppBar(
        title: const Text(
          'Choisir une catégorie',
          style: TextStyle(
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w700,
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        foregroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0),
            child: Divider(
              color: Color(0xFFCDCDCD),
              height: 1.0,
              thickness: 1.0,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(child: _buildCategoryList()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['Femme', 'Homme', 'Enfants'].map((tab) {
          final isSelected = selectedTab == tab;
          return GestureDetector(
            onTap: () => setState(() => selectedTab = tab),
            child: Column(
              children: [
                Text(
                  tab,
                  style: TextStyle(
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 40,
                    decoration: const BoxDecoration( // Ajout de la BoxDecoration
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF18B4BC), // Couleur de la bordure : bleu clair
                          width: 1.0,                 // Épaisseur de la bordure : 1px
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryList() {
    final selectedCategories = categories[selectedTab] ?? [];

    return ListView.builder(
      itemCount: selectedCategories.length,
      itemBuilder: (context, index) {
        final item = selectedCategories[index];
        final leadingWidget = Text(
          item['emoji'] ?? '🛍️',
          style: const TextStyle(fontSize: 24),
        );

        return Column(
          children: [
            ListTile(
              leading: leadingWidget,
              title: Text(
                item['name'],
                style: const TextStyle(
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            if (index < selectedCategories.length - 1)
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
                indent: 15,
                endIndent: 15,
              ),
          ],
        );
      },
    );
  }
}

