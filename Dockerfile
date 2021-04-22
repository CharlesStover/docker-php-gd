FROM php:7.4.0-apache
LABEL Author "Charles Stover <docker@charlesstover.com>"

# Given (Dependencies)
RUN apt-get update
RUN apt-get install -y libjpeg-dev  libpng-dev

# Given (Unused Files)
RUN rm -rf /etc/apache2/conf-available
RUN rm -rf /etc/apache2/conf-enabled
RUN rm -rf /etc/apache2/ports.conf
RUN rm -rf /etc/apache2/sites-available
RUN rm -rf /etc/apache2/sites-enabled

# When (PHP)
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# When (Apache)
RUN cp /etc/mime.types /etc/apache2/mime.types
COPY apache2.conf /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN service apache2 restart

# Start
EXPOSE 80
