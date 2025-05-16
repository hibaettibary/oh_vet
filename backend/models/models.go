package models

import "gorm.io/gorm"

// Utilisateur représente un utilisateur de l'application.
type Utilisateur struct {
	gorm.Model
	IDClient        string `gorm:"primaryKey" json:"id_client"`
	Pseudo          string `json:"pseudo"`
	Email           string `json:"email"`
	Nom             string `json:"nom"`
	Prenom          string `json:"prenom"`
	Password        string `json:"password"`
	Telephone       string `json:"telephone"`
	Adresse         string `json:"adresse"`
	Ville           string `json:"ville"`
	CodePostal      string `json:"code_postal"`
	DateInscription string `json:"date_inscription"`
	PhotoURL        string `json:"photo_url"`
}

// Product représente un produit publié.
type Product struct {
	IDProduct           int     `gorm:"primaryKey" json:"id_product"`
	IDClient            string  `json:"id_client"` // correspond à Utilisateur.IDClient
	IDSousSousCategorie int     `json:"id_sous_sous_categorie"`
	Titre               string  `json:"titre"`
	Taille              string  `json:"taille"`
	Marque              string  `json:"marque"`
	Description         string  `json:"description"`
	PrixVente           float64 `json:"prix_vente"`
	PrixRegulier        float64 `json:"prix_regulier"`
	DateCreation        string  `json:"date_creation"`
}

// Categorie représente une catégorie principale.
type Categorie struct {
	IDCategorie int    `gorm:"primaryKey" json:"id_categorie"`
	Nom         string `json:"nom"`
}

// SousCategorie représente une sous-catégorie liée à une catégorie.
type SousCategorie struct {
	IDSousCategorie int    `gorm:"primaryKey" json:"id_sous_categorie"`
	Nom             string `json:"nom"`
	IDCategorie     int    `json:"id_categorie"`
}

// SousSousCategorie représente une sous-sous-catégorie.
type SousSousCategorie struct {
	IDSousSousCategorie int    `gorm:"primaryKey" json:"id_sous_sous_categorie"`
	Nom                 string `json:"nom"`
	IDSousCategorie     int    `json:"id_sous_categorie"`
}

// Commentaire représente un commentaire fait sur un produit.
type Commentaire struct {
	IDCommentaire   int    `gorm:"primaryKey" json:"id_commentaire"`
	IDClient        string `json:"id_client"`  // correspond à Utilisateur.IDClient
	IDProduct       int    `json:"id_product"` // correspond à Product.IDProduct
	Contenu         string `json:"contenu"`
	DateCommentaire string `json:"date_commentaire"`
}

// Image représente une image liée à un produit.
type Image struct {
	IDImage   int    `gorm:"primaryKey" json:"id_image"`
	IDProduct int    `json:"id_product"`
	URL       string `json:"url"`
}

// Conversation entre un utilisateur et un autre.
type Conversation struct {
	IDConversation int    `gorm:"primaryKey" json:"id_conversation"`
	Email          string `json:"email"` // utilisateur avec qui on discute
}

// Historique des interactions d'un utilisateur avec des produits.
type Historique struct {
	IDHistorique   int    `gorm:"primaryKey" json:"id_historique"`
	IDClient       string `json:"id_client"`  // cohérent avec Utilisateur.IDClient
	IDProduct      int    `json:"id_product"` // cohérent avec Product.IDProduct
	DateHistorique string `json:"date_historique"`
}

// Commande représente une transaction entre un client et un produit.
type Commande struct {
	IDCommande int    `gorm:"primaryKey" json:"id_commande"`
	IDClient   string `json:"id_client"`
	IDProduct  int    `json:"id_product"`
}

// Avis laissé sur un produit par un acheteur à un vendeur.
type Avis struct {
	IDProduct  int    `gorm:"primaryKey" json:"id_product"`
	IDAcheteur string `json:"id_acheteur"` // changé en string pour correspondre à IDClient
	IDVendeur  string `json:"id_vendeur"`  // idem
}

// Favoris : lien entre utilisateur et produit en favori.
type Favoris struct {
	IDClient  string `gorm:"primaryKey" json:"id_client"`
	IDProduct int    `gorm:"primaryKey" json:"id_product"`
}
