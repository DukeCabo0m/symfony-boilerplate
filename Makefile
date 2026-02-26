.PHONY: up down install shell logs db-create migrate fixtures db-reset

# --- Docker ---

up:
	docker compose up -d --build

down:
	docker compose down

shell:
	docker compose exec php sh

logs:
	docker compose logs -f

# --- Installation ---

install: up
	@echo "⏳ Création du projet Symfony..."
	docker compose exec php composer create-project symfony/skeleton:"^8.0" tmp
	docker compose exec php sh -c "cp -a tmp/. . && rm -rf tmp"
	@echo "⏳ Installation de l'ORM (Doctrine)..."
	docker compose exec php composer require orm
	@echo "⏳ Installation du MakerBundle et des Fixtures..."
	docker compose exec php composer require --dev maker-bundle orm-fixtures
	@echo "=========================================================="
	@echo "✅ Installation complète terminée avec succès !"
	@echo "🌍 Application : https://localhost"
	@echo "📧 Mailpit : http://localhost:8025"
	@echo "🛠️  Tu peux maintenant générer ta première entité avec :"
	@echo "   make shell"
	@echo "   php bin/console make:entity"
	@echo "=========================================================="

# --- Base de données (Doctrine) ---

db-create:
	docker compose exec php bin/console doctrine:database:create --if-not-exists

migrate:
	docker compose exec php bin/console doctrine:migrations:migrate --no-interaction

fixtures:
	docker compose exec php bin/console doctrine:fixtures:load --no-interaction

db-reset:
	docker compose exec php bin/console doctrine:database:drop --force --if-exists
	make db-create
	make migrate
	make fixtures