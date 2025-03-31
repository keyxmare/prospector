# Prospector

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![PHP](https://img.shields.io/badge/php-8.4-blue.svg)]()
[![Symfony](https://img.shields.io/badge/Symfony-7.2-black.svg)]()

Prospector est un outil développé pour automatiser, simplifier et fiabiliser la récupération de données de toute sorte.

## 🚀 Fonctionnalités principales

- Les fonctionnalités sont actuellement en cours de développement.
- Parmi les objectifs futurs :
  - 📥 Import de données multi-formats
  - 🔍 Extraction ciblée via scripts personnalisables
  - ⚙️ Automatisations récurrentes via planification
  - 🔌 Intégration avec des APIs tierces
  - 📦 Export dans différents formats exploitables

## 🏗️ Stack technique

- **Langage principal :** PHP (8.4)
- **Framework :** Symfony
- **Base de données :** MySQL
- **Serveur web :** Caddy
- **Environnement de développement :** Docker (avec Xdebug et MySQL)
- **Supervision :** Supervisor

## ⚙️ Installation

### Pré-requis

- Docker & Docker Compose
- Make

### Lancement du projet

```bash
make dev
```

Accès à l'application :
- http://localhost (ou selon configuration du Caddyfile)

### Commandes utiles

```bash
make dev                 # Démarre les conteneurs Docker
make stop                # Stoppe tous les conteneurs
make logs                # Affiche les logs
make shell               # Ouvre un shell dans le conteneur principal (prospector)
make -C back help        # Affiche les commandes Symfony disponibles
make -C back test        # Exécute les tests PHPUnit
make -C back shell       # Ouvre un shell dans le conteneur Symfony
make -C back cache-clear # Vide le cache Symfony
```

## 🐞 Debug avec Xdebug

- Port : `9003`
- Activation via navigateur : `?XDEBUG_SESSION_START=PHPSTORM`
- Activation CLI :
  ```bash
  XDEBUG_TRIGGER=1 php script.php
  ```

## 📂 Structure du projet

```
.
├── back/                 # Code source principal de l'application Symfony
│   ├── bin/              # Entrées CLI Symfony (ex: console)
│   ├── config/           # Fichiers de configuration Symfony
│   ├── public/           # Racine web, contient index.php
│   ├── src/              # Code métier (contrôleurs, services, entités)
│   └── var/              # Cache, logs et fichiers générés
├── docker/               # Configuration de l'environnement de dev
│   ├── caddy/            # Config du reverse proxy Caddy
│   ├── php/              # Configuration PHP (php.ini, xdebug.ini)
│   ├── supervisor/       # Config pour superviser les workers/services
│   └── traefik/          # Configuration alternative de reverse proxy
└── .idea/                # Fichiers de configuration JetBrains/PhpStorm
```

## 🧪 Tests

```bash
make test
```

Les PR sont les bienvenues ! Merci de :
- Créer une branche dédiée (`feature/`, `bugfix/`, etc.)
- Écrire des tests pertinents
- Documenter vos changements

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier [`LICENSE`](LICENSE).

## 🙌 Remerciements

Merci à tous les contributeurs, testeurs et utilisateurs de Prospector !
