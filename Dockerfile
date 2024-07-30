FROM ubuntu:jammy

RUN apt-get update --allow-releaseinfo-change && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    php-cli \
    php-curl \
    php-gd \
    php-xml \
    php-zip \
    unzip \
    && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); die(1); } echo PHP_EOL;"  && \
    php composer-setup.php "--version=2.7.7" --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

#COPY ./*.php ./composer.json /var/www/
#RUN cd /var/www && COMPOSER_ALLOW_SUPERUSER=1 composer install
#WORKDIR /var/www
#CMD ['php' '/var/www/test.php']
