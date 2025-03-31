# 🛠️ Makefile principal pour Prospector — Votre assistant de fouille de données 🕵️‍♀️

.DEFAULT_GOAL := help
.PHONY: help dev stop logs rebuild back

## 🚀 Commandes principales

help:  ## 🆘 Affiche ce menu d'aide coloré
	@echo ""
	@echo "🛠️  Commandes principales :"
	@grep -Eh '^[a-zA-Z_-]+:.*?## .*$$' Makefile | grep -v '^back:' | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

	@echo ""
	@echo "📦 Pour exécuter des commandes Symfony :"
	@echo "  \033[35mmake -C back <commande>\033[0m (ex: make -C back test, make -C back shell)"
	@echo ""
	@make -sC back help | tail -n +3 | grep -vE '^\s*$$' | awk '{printf "  \033[35m[back]\033[0m %s\n", $$0}' || true
	@echo ""

dev:  ## 🐳 Démarre l'environnement Docker (dev)
	docker network inspect traefik >/dev/null 2>&1 || docker network create traefik
	docker compose -f docker/compose.yaml -p prospector up -d --build

stop:  ## 🛑 Stoppe tous les conteneurs Docker
	docker compose -f docker/compose.yaml -p prospector down

logs:  ## 📜 Affiche les logs en temps réel
	docker compose -f docker/compose.yaml -p prospector logs -f

rebuild:  ## 🔧 Reconstruction complète des conteneurs
	docker network inspect traefik >/dev/null 2>&1 || docker network create traefik
	docker compose -f docker/compose.yaml -p prospector down -v --remove-orphans
	docker compose -f docker/compose.yaml -p prospector build --no-cache
	docker compose -f docker/compose.yaml -p prospector up -d

back:  ## 📦 Transmet une commande au Makefile du dossier back/
	@make -C back $(filter-out $@,$(MAKECMDGOALS))

zip:  ## 🗜️ Archive le projet en excluant les dossiers inutiles
	zip -r prospector.zip ./ -x "back/vendor/*" "back/var/*" ".git/*" ".idea/*" "*.zip"