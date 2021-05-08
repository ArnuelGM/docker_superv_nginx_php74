FROM php:7.4-fpm-buster
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN apt update && apt install -y --no-install-recommends supervisor nginx && \
    ## PHP Extensions
    install-php-extensions bcmath bz2 calendar \
    exif gd gettext gmp imap intl ldap mcrypt mysqli \
    odbc pcntl pdo_mysql pdo_odbc pdo_sqlsrv shmop soap \
    sockets sqlsrv sysvmsg sysvsem sysvshm xmlrpc xsl zip

COPY supervisor.conf /etc/supervisor/conf.d/
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY default /etc/nginx/sites-available/
CMD [ "/entrypoint.sh" ]
