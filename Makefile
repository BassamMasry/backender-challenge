run:
	docker compose up -d --build --remove-orphans
restart:
	docker compose up -d --no-deps --build app
install:
	make migrations
	make migrate
	make superuser
migrations:
	docker compose exec app bash -c "python manage.py makemigrations"
migrate:
	docker compose exec app bash -c "python manage.py migrate"
superuser:
	docker compose exec app bash -c "python manage.py createsuperuser"
shell:
	docker compose exec app bash
lint:
	docker compose run --rm app ruff check --fix
test:
	docker compose run --rm app pytest -svv
applogs:
	docker compose logs app
