import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Utilisateur_model.dart';

class AuthService {
  final String baseUrl = 'http://192.168.100.125:8080';

  // Fonction d'inscription
  Future<bool> register(Utilisateur utilisateur) async {
    final url = Uri.parse('$baseUrl/signup_page');
  
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(utilisateur.toMap()),  // méthode toMap() dans ton modèle
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Inscription réussie');
        return true;
      } else {
        print('Échec de l\'inscription : ${response.body}');
        return false;
      }
    } catch (e) {
      print('Erreur lors de l\'inscription : $e');
      return false;
    }
  }
}
