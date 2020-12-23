FROM php:7.4-apache 

# 1. git, unzip & zip are for composer
RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    gnupg \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libicu-dev \
    libxml2-dev \
    wget \
    nano \
    unzip \
    zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libpq-dev libldap2-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd  \
    && docker-php-ext-configure ldap  --with-libdir=lib/x86_64-linux-gnu/  \
    && docker-php-ext-install mysqli gd opcache pdo pdo_mysql pgsql pdo_pgsql ldap bcmath

# 2. apache configs + document root
ENV APACHE_DOCUMENT_ROOT=/var/www/
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers
RUN a2enmod rewrite
RUN a2enmod ssl

EXPOSE 80
EXPOSE 443

#ssl
ADD ./settings/000-default.conf /etc/apache2/sites-enabled/
#ADD ./settings/default-ssl.conf /etc/apache2/sites-anabled/
#COPY ./settings/ssl.crt /etc/apache2/ssl/ssl.crt
#COPY ./settings/ssl.key /etc/apache2/ssl/ssl.key
#RUN ln -s /etc/setting/default-ssl.conf  /etc/apache2/mods-enabled/default-ssl.conf
RUN mkdir -p /var/run/apache2/ \
    && apachectl restart \
    && apachectl stop \
    && apachectl start
