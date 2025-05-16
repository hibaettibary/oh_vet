class Utilisateur {
  final String email; // Identifiant unique
  final String? nom;
  final String? prenom;
  final String? password;
  final String? telephone;
  final String? adresse;
  final String? ville;
  final String? codePostal;
  final DateTime? dateInscription;
  final String? photoUrl;

  Utilisateur({
    required this.email,
    this.nom,
    this.prenom,
    this.password,
    this.telephone,
    this.adresse,
    this.ville,
    this.codePostal,
    this.dateInscription,
    this.photoUrl,
  });

  // Convertir l'objet en Map pour envoyer au backend
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nom': nom,
      'prenom': prenom,
      'password': password,
      'telephone': telephone,
      'adresse': adresse,
      'ville': ville,
      'code_postal': codePostal,
      'date_inscription': dateInscription?.toIso8601String(),
      'photo_url': photoUrl,
    };
  }

  // Créer un objet Utilisateur depuis un Map (par exemple venant du backend)
  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      email: map['email'],
      nom: map['nom'],
      prenom: map['prenom'],
      password: map['password'],
      telephone: map['telephone'],
      adresse: map['adresse'],
      ville: map['ville'],
      codePostal: map['code_postal'],
      dateInscription: map['date_inscription'] != null
          ? DateTime.parse(map['date_inscription'])
          : null,
      photoUrl: map['photo_url'],
    );
  }
}
