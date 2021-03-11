FROM debian:buster

RUN apt update
RUN apt upgrade -y
RUN apt -y install nginx \
                    wget \
                    php-fpm \
                    php7.3 \
                    php-mysql \
                    mariadb-server\
                    php-xml\
                    vim

COPY ./srcs/nginx.conf ./etc/nginx/sites-available/default

WORKDIR /var/www/html
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm -rf latest.tar.gz
WORKDIR /var/www/html/wordpress
COPY ./srcs/wp_config.php ./wp-config.php

WORKDIR /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
WORKDIR /


COPY ./srcs/init.sh ./
CMD [ "/bin/bash", "./init.sh" ]