WP_DATA=$(HOME)/data/wordpress
DB_DATA=$(HOME)/data/mariadb
DOCKER_COMPOSE=srcs/docker-compose.yml

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker-compose -f $(DOCKER_COMPOSE) up -d

down:
	docker-compose -f $(DOCKER_COMPOSE) down

stop:
	docker-compose -f $(DOCKER_COMPOSE) stop

start:
	docker-compose -f $(DOCKER_COMPOSE) start

build:
	docker-compose -f $(DOCKER_COMPOSE) build

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@sudo rm -rf $(WP_DATA) || true
	@sudo rm -rf $(DB_DATA) || true

re: clean up

prune: clean
	@docker system prune -a --volumes -f
