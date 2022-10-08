FROM php:8.1-fpm

WORKDIR /app

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
        libzip-dev \
        libonig-dev \
        curl \
        zip \
        unzip \
    && docker-php-ext-install pdo pdo_mysql zip mbstring
