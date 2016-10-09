#!/usr/bin/env bash

chown -R apache:apache /srv
mkdir -p /run/apache2 && chown -R apache:apache /run/apache2
sed -i 's#^DocumentRoot ".*#DocumentRoot "/srv/wordpress"#g' /etc/apache2/httpd.conf
sed -i 's#AllowOverride [nN]one#AllowOverride All#g' /etc/apache2/httpd.conf
sed -i 's#^<Directory ".*>#<Directory "/srv/wordpress">#g' /etc/apache2/httpd.conf
sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /etc/apache2/httpd.conf
sed -i 's#ErrorLog logs/error.log#/dev/stderr#g' /etc/apache2/httpd.conf

echo "CustomLog /dev/stdout combined" >> /etc/apache2/httpd.conf

# logs should go to stdout / stderr
ln -sfT /dev/stderr "/var/log/apache2/error.log"
ln -sfT /dev/stdout "/var/log/apache2/access.log"
ln -sfT /dev/stdout "/var/log/apache2/other_vhosts_access.log"
