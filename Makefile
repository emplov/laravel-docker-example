init: docker-build \
	docker-down \
	docker-up \
	project-composer-install

docker-build:
	make docker-compose COMMAND="build"
docker-up:
	make docker-compose COMMAND="up -d"
docker-down:
	make docker-compose COMMAND="down --remove-orphans"
docker-compose:
	docker-compose ${COMMAND}

project-composer-install:
	make docker-compose COMMAND="run --rm cli composer install"
project-composer-update:
	make docker-compose COMMAND="run --rm cli composer update ${name}"
project-composer:
	make docker-compose COMMAND="run --rm cli composer ${name}"

