FROM php:7.2-apache

#   intalling tools necessary for installing the extentions necessary to install laravel
RUN apt update;
RUN apt install -y zip zlib1g-dev
#   installing necessary extentions
RUN docker-php-ext-install mbstring zip

#   Downloading installing and deleting the installer for composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" ;\
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" ;\
php composer-setup.php && \
php -r "unlink('composer-setup.php');"

#   Make it a global bin
RUN mv composer.phar /usr/local/bin/composer;

RUN composer global require laravel/installer
#RUN chown -R www-data /var/www/html
#RUN chgrp -R pixel . ; chmod -R g+w .
#RUN /root/.composer/vendor/laravel/installer/laravel new lara-app --force

RUN apt install mysql-server
#   intalling mysql driver for php
RUN docker-php-ext-install pdo pdo_mysql

composer require doctrine/dbal
RUN service mysql start
