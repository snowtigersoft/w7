FROM daocloud.io/php:5.6.5-apache

ADD ./sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        netstat-nat \
        net-tools \
        cron \
    && docker-php-ext-install iconv mcrypt\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd pdo pdo_mysql zip mbstring pcntl \
    && a2enmod proxy_wstunnel

