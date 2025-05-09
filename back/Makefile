# 🧠 Makefile Symfony (back/) — Commandes utiles pour le développement PHP ⚙️

.PHONY: help shell test xdebug-on xdebug-off cache-clear migrations symfony phpstan rector

.DEFAULT_GOAL := help

## 🛠️ Commandes Symfony

help:  ## 🆘 Affiche cette aide
	@echo ""
	@echo "📦 Commandes Symfony (depuis back/):"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[35m%-18s\033[0m %s\n", $$1, $$2}'
	@echo ""

shell:  ## 🐚 Ouvre un shell dans le conteneur PHP
	docker compose -f docker/compose.yaml -p prospector exec application sh -c sh

test:  ## ✅ Lance les tests PHPUnit
	docker compose -f docker/compose.yaml -p prospector exec application php bin/phpunit

xdebug-on:  ## 🐞 Active Xdebug (mode debug)
	docker compose -f docker/compose.yaml -p prospector exec application bash -c "echo 'xdebug.mode=debug' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && pkill -o php-fpm"

xdebug-off: ## ❌ Désactive Xdebug
	docker compose -f docker/compose.yaml -p prospector exec application sed -i '/xdebug.mode/d' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && docker compose -f docker/compose.yaml -p prospector exec application pkill -o php-fpm

cache-clear: ## 🧹 Vide le cache Symfony
	docker compose -f docker/compose.yaml -p prospector exec application php bin/console cache:clear

migrations:  ## 🗄️ Exécute les migrations Doctrine
	docker compose -f docker/compose.yaml -p prospector exec application php bin/console doctrine:migrations:migrate

symfony:  ## 🧰 Exécute une commande Symfony personnalisée
	docker compose -f docker/compose.yaml -p prospector exec application php bin/console $(filter-out $@,$(MAKECMDGOALS))

phpstan: ## 🕵️‍♂️ Analyse statique du code avec PHPStan
	docker compose -f docker/compose.yaml -p prospector exec application vendor/bin/phpstan analyse --configuration=phpstan.dist.neon

rector: ## 🔧 Applique des refactorisations automatiques avec Rector
	docker compose -f docker/compose.yaml -p prospector exec application vendor/bin/rector process --config=rector.php