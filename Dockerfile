FROM php:7.1-apache

RUN apt-get update

RUN apt-get install -y \
  curl \
  git \
  supervisor \
  zip \
  unzip

RUN docker-php-ext-install pdo_mysql mysqli

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN a2enmod rewrite

ENV APP_HOME /var/www/html

RUN mkdir -p /opt/data/public && \
  rm -r /var/www/html && \
  ln -s /opt/data/public $APP_HOME

WORKDIR $APP_HOME
