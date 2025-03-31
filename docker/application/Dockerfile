FROM php:8.4.5-fpm-alpine3.21 AS base

RUN apk update && apk add --no-cache caddy supervisor && \
    mkdir -p /etc/supervisor.d /var/log/supervisor /var/www && \
    rm -rf /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo pdo_mysql

FROM base AS dev

COPY application/caddy/Caddyfile /etc/caddy/Caddyfile
COPY application/supervisor /etc/supervisor.d/
COPY application/php/php.ini "$PHP_INI_DIR/php.ini"
COPY application/php/xdebug.ini "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini"

RUN apk add --no-cache $PHPIZE_DEPS linux-headers && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]