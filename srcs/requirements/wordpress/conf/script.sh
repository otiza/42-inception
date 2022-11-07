apt-get install wget -y

mkdir -p /var/www/html
chown -R www-data /var/www/html/
chmod -R 755 /var/www/html/

mv ./wordpress /var/www/html/

rm -rf /var/www/html/index.nginx-debian.html 
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

service php7.3-fpm start
service php7.3-fpm stop
/usr/sbin/php-fpm7.3 -F -R
