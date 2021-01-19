FROM php:7.4-fpm-buster

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN apt update && apt install -y --no-install-recommends supervisor nginx && \
    ## PHP Extensions
    install-php-extensions \
    bcmath bz2 calendar \
    exif gd \
    gettext gmp imap intl \
    ldap mcrypt mysqli \
    pcntl pdo_mysql \
    shmop soap \
    sockets sysvmsg \
    sysvsem sysvshm \
    xmlrpc xsl zip \
    pdo_sqlsrv sqlsrv
    #wddx zend

COPY supervisor.conf /etc/supervisor/conf.d/
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY default /etc/nginx/sites-available/
CMD [ "/entrypoint.sh" ]