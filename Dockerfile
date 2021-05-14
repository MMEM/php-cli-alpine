## See Dockerfile.ecr-full
FROM php:8-cli-alpine

RUN set -xe \
    && apk add --update icu \
    && apk add --no-cache --virtual .deps make icu-dev g++ libtool $PHPIZE_DEPS \
    && apk add --no-cache libmcrypt-dev \
    && yes | pecl install -o -f mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install tokenizer \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-enable intl \
    && { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } \
    && apk del .deps \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

COPY ./laravel.ini  /usr/local/etc/php/conf.d

RUN apk --update add curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apk add mysql-client bash

WORKDIR /var/www

RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."
