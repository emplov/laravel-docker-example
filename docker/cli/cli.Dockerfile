FROM php:8.1-cli

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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u 2000 -d /home/app app
RUN mkdir -p /home/app/.composer && \
    chown -R app:app /home/app

USER app
