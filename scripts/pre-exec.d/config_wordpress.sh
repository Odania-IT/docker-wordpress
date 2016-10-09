#!/bin/bash

cp /srv/wp-config.php /srv/wordpress/wp-config.php
chown apache:apache /srv/wordpress/wp-config.php

function set_config {
    sed -i "s#$1#$2#" /srv/wordpress/wp-config.php
}

# Configure database
set_config 'WORDPRESS_DB_HOST' "${WORDPRESS_DB_HOST}"
set_config 'WORDPRESS_DB_USER' "${WORDPRESS_DB_USER}"
set_config 'WORDPRESS_DB_PASSWORD' "${WORDPRESS_DB_PASSWORD}"
set_config 'WORDPRESS_DB_NAME' "${WORDPRESS_DB_NAME}"

# Configure salts and keys
set_config 'WORDPRESS_AUTH_KEY' "${WORDPRESS_DB_HOST}"
set_config 'WORDPRESS_SECURE_AUTH_KEY' "${WORDPRESS_SECURE_AUTH_KEY}"
set_config 'WORDPRESS_LOGGED_IN_KEY' "${WORDPRESS_LOGGED_IN_KEY}"
set_config 'WORDPRESS_NONCE_KEY' "${WORDPRESS_NONCE_KEY}"
set_config 'WORDPRESS_AUTH_SALT' "${WORDPRESS_AUTH_SALT}"
set_config 'WORDPRESS_SECURE_AUTH_SALT' "${WORDPRESS_SECURE_AUTH_SALT}"
set_config 'WORDPRESS_LOGGED_IN_SALT' "${WORDPRESS_LOGGED_IN_SALT}"
set_config 'WORDPRESS_NONCE_SALT' "${WORDPRESS_NONCE_SALT}"
