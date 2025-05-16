package main

import (
	"net/http"

	"oh_vet/backend/models"

	"github.com/gin-contrib/cors" // <-- import cors
	"github.com/gin-gonic/gin"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	db, err := gorm.Open(sqlite.Open("ohvet.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	db.AutoMigrate(&models.Utilisateur{})

	router := gin.Default()

	// Ajout du middleware CORS avec la config par défaut
	router.Use(cors.Default())

	// Route POST /signup_page
	router.POST("/signup_page", func(c *gin.Context) {
		var user models.Utilisateur

		// Bind JSON reçu dans la requête au struct user
		if err := c.ShouldBindJSON(&user); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		// Ici tu peux ajouter validation, hashage de mot de passe, etc.

		// Sauvegarder l'utilisateur en base
		result := db.Create(&user)
		if result.Error != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
			return
		}

		c.JSON(http.StatusOK, gin.H{"message": "Inscription réussie"})
	})

	router.Run(":8080")
}
