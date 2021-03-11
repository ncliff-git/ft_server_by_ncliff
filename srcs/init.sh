openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=21School/CN=localhost"
service nginx start
service mysql start
service php7.3-fpm start

mysql -e "create database ncliff_database;"
mysql -e "create user admin;"
mysql -e "grant all on ncliff_database.* to 'admin'@'localhost' identified by 'admin';"
mysql -e "flush privileges;"

bash