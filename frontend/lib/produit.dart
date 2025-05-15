import 'package:flutter/material.dart';

class ProduitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application complète',
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    CategorySelectionPage(),
    TablePage(),
    ItemDetailPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catégories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Tableaux',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produit',
          ),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

// Page de sélection de catégorie
class CategorySelectionPage extends StatefulWidget {
  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  int _selectedCategory = 0;
  final List<String> categories = ['Femme', 'Homme', 'Enfants'];
  final List<String> sections = ['Vêtements', 'Chaussures', 'Sacs', 'Accessoires'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: _selectedCategory == index ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: _selectedCategory == index ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: sections.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sections[index],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page des tableaux
class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tableaux complexes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFirstTable(),
            SizedBox(height: 30),
            _buildSecondTable(),
            SizedBox(height: 30),
            _buildTypeSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            _buildHeaderCell('Witness'),
            _buildHeaderCell('Name of success'),
            _buildHeaderCell('Number related'),
          ],
        ),
        ..._buildTableRows([
          ['Maps', 'Time & hours', 'Percentage'],
          ['Sounds', 'None of the', 'Number'],
          ['Time & Hours', 'None', 'Number'],
          ['Total', 'None', 'Number'],
        ]),
      ],
    );
  }

  Widget _buildSecondTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(3),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[200]),
          children: [
            _buildHeaderCell('Nomination'),
            _buildHeaderCell("Chairman's"),
            _buildHeaderCell('Size'),
            _buildHeaderCell('Accessories'),
          ],
        ),
        ..._buildTableRows([
          ['Insurance & costs', 'home', 'Box 1 Point', 'Sales'],
          ['Limited and Legal rights', 'Consumer Labor', 'LIFE 1 Installation', 'Reserve'],
        ]),
      ],
    );
  }

  Widget _buildTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('TYPE:', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 200,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: 50,
            itemBuilder: (context, index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Text('0.${index + 1}'),
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> _buildTableRows(List<List<String>> data) {
    return data.map((row) => TableRow(
      children: row.map((cell) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(cell),
      )).toList(),
    )).toList();
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

// Page de détail de l'article
class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détail produit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildInfoRow('Titre', 'Jhonathane'),
              _buildInfoRow('Type d’élément', 'Choissire'),
              _buildInfoRow('Marque', 'Nike'),
              _buildInfoRow('Taille', '42 / L'),
              _buildPriceRow('Prix de vente', '1200,00 MAD'),
              _buildPriceRow('Prix régulier', '1200,00 MAD'),
              _buildInfoRow('Genre', 'Homme'),
              _buildInfoRow('Categorie', 'Chaussure'),
              _buildInfoRow('Sous-Categorie', 'Choisoire'),
              SizedBox(height: 20),
              Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Ecrire ici...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _handleUpdate(),
                child: Text('UPDATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value, style: TextStyle(color: Colors.green))),
        ],
      ),
    );
  }

  void _handleUpdate() {
    if (_formKey.currentState!.validate()) {
      print('Description mise à jour: ${_descriptionController.text}');
    }
  }
}
