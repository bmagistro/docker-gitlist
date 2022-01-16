FROM php:8.1.1-apache-bullseye

RUN apt-get update \
 && apt-get --yes --no-install-recommends install git unzip \
 && apt-get clean \
 && ln -s /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
 && mkdir /var/www/gitlist \
 && cd /var/www/gitlist \
 && curl -L https://github.com/klaussilveira/gitlist/releases/download/1.1.1/gitlist-1.1.1.zip -o gitlist.zip \
 && unzip gitlist.zip \
 && rm gitlist.zip \
 && mkdir cache \
 && chown -R www-data:www-data /var/www/gitlist \
 && a2enmod rewrite

COPY apache-gitlist.conf /etc/apache2/sites-enabled/000-default.conf
COPY gitlist.ini /var/www/gitlist/config.ini

WORKDIR /var/www/gitlist

EXPOSE 80/tcp

VOLUME /repos
