build:
	docker compose build --no-cache
up:
	docker compose up -d
down:
	docker compose down --remove-orphans
ash: 
	docker compose exec terraform /bin/ash