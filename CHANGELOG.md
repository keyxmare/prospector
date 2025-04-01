# Changelog

## [Unreleased]

### Chore
- 🧰 add PhpStorm project configuration (.idea)
- 🧪 add commit-msg hook to enforce Conventional Commits
- 🐳 ajout de la configuration Docker (PHP, Caddy, Supervisor)
- 🛠️ ajout du Makefile pour les commandes de dev
- 📁 isolement des fichiers liés à Docker dans le dossier docker/
- 🔧 ajout d’un hook pre-commit pour générer le changelog
- 🔧 ajout d’une fonction pour sauvegarder le dernier tag dans le .env

### Fonctionnalité
- 🎉 initialisation du projet avec Symfony (web-skeleton)
- 🧰 ajout de Composer dans l'image Docker
- 🧪 ajout de WebProfilerBundle pour dev/test

### Corrigé
- 🛠️ corrige la détection des types pour éviter que tout passe en "Autres"


