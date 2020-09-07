#!/usr/bin/env bash
set -ex

cd /opt

apt-get update
pecl channel-update pecl.php.net

apt-get install -y zlib1g-dev libmemcached-dev
pecl install apcu memcached igbinary

# compile Redis with igbinary support
pecl bundle redis
cd redis
phpize
./configure --enable-redis-igbinary
make
make install

# Install extensions
docker-php-ext-install bcmath sockets
docker-php-ext-enable apcu igbinary memcached opcache redis

# Cleanup
docker-php-source delete
rm -r /tmp/* /var/cache/* /var/www/html/*

# Config
echo 'opcache.interned_strings_buffer=16' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
echo 'opcache.load_comments=Off' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
echo 'opcache.max_accelerated_files=16000' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
echo 'opcache.save_comments=Off' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
