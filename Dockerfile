FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libtidy-dev \
        g++ \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install gettext \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install intl \
    && docker-php-ext-install tidy \
    && pear install Services_Weather \
    && pear install Net_DNS2
