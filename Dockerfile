FROM richarvey/nginx-php-fpm:3.1.6

WORKDIR /var/www/html

# RUN apt-get update && apt-get install -y --fix-missing gnupg apt-utils
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./conf/nginx/default.conf /etc/nginx/sites-enabled/default.conf
COPY . .

# RUN apt-get install -y git \
#                     zlib1g-dev \
#                     libzip-dev \
#                     && docker-php-ext-install zip

EXPOSE 8000

RUN composer install --optimize-autoloader --no-dev && php artisan config:cache