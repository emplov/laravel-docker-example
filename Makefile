init: build \
	down \
	up \
	composer-install \
	artisan-migrate

build:
	make docker-compose COMMAND="build"
up:
	make docker-compose COMMAND="up -d"
down:
	make docker-compose COMMAND="down --remove-orphans"
docker-compose:
	docker-compose ${COMMAND}

pint-test:`
	make docker-compose COMMAND="run --rm cli ./vendor/bin/pint --test"
pint-fix:
	make docker-compose COMMAND="run --rm cli ./vendor/bin/pint -v"
php-stan:
	make docker-compose COMMAND="run --rm cli ./vendor/bin/phpstan analyse --memory-limit=2G --configuration='docker/config/phpstan.neon.dist'"
test-unit:
	make docker-compose COMMAND="run --rm cli php artisan test --testsuite=Unit --stop-on-failure"
test-feature:
	make docker-compose COMMAND="run --rm cli php artisan test --testsuite=Feature --stop-on-failure"

artisan-migrate:
	make docker-compose COMMAND="run --rm cli php artisan migrate"

composer-install:
	make docker-compose COMMAND="run --rm cli composer install"
composer-update:
	make docker-compose COMMAND="run --rm cli composer update ${name}"
composer:
	make docker-compose COMMAND="run --rm cli composer ${name}"

