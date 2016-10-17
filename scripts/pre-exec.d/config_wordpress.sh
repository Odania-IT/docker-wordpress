#!/bin/bash

cp /srv/wp-config.php /srv/wordpress/wp-config.php
chown apache:apache /srv/wordpress/wp-config.php

# see http://stackoverflow.com/a/2705678/433558
# see https://github.com/docker-library/wordpress/blob/master/php7.0/apache/docker-entrypoint.sh
sed_escape_rhs() {
	echo "$@" | sed -e 's/[\/&]/\\&/g'
}
php_escape() {
	php -r 'var_export(('$2') $argv[1]);' -- "$1"
}
set_config() {
	key="$1"
	value="$2"
	var_type="${3:-string}"
	sed -ri -e "s/$1/$(sed_escape_rhs "$(php_escape "$value" "$var_type")")/" /srv/wordpress/wp-config.php
}

set_config 'WORDPRESS_DOMAIN_CURRENT_SITE' "${WORDPRESS_DOMAIN_CURRENT_SITE}"

if [ "${WORDPRESS_ENABLE_MULTISITE}" == "true" ]; then
	sed -ri -e "s/WORDPRESS_ENABLE_MULTISITE/true/" /srv/wordpress/wp-config.php
else
	sed -ri -e "s/WORDPRESS_ENABLE_MULTISITE/false/" /srv/wordpress/wp-config.php
fi

# Configure database
set_config 'WORDPRESS_DB_HOST' "${WORDPRESS_DB_HOST}"
set_config 'WORDPRESS_DB_USER' "${WORDPRESS_DB_USER}"
set_config 'WORDPRESS_DB_PASSWORD' "${WORDPRESS_DB_PASSWORD}"
set_config 'WORDPRESS_DB_NAME' "${WORDPRESS_DB_NAME}"

# Configure salts and keys
set_config 'WORDPRESS_AUTH_KEY' "${WORDPRESS_AUTH_KEY}"
set_config 'WORDPRESS_SECURE_AUTH_KEY' "${WORDPRESS_SECURE_AUTH_KEY}"
set_config 'WORDPRESS_LOGGED_IN_KEY' "${WORDPRESS_LOGGED_IN_KEY}"
set_config 'WORDPRESS_NONCE_KEY' "${WORDPRESS_NONCE_KEY}"
set_config 'WORDPRESS_AUTH_SALT' "${WORDPRESS_AUTH_SALT}"
set_config 'WORDPRESS_SECURE_AUTH_SALT' "${WORDPRESS_SECURE_AUTH_SALT}"
set_config 'WORDPRESS_LOGGED_IN_SALT' "${WORDPRESS_LOGGED_IN_SALT}"
set_config 'WORDPRESS_NONCE_SALT' "${WORDPRESS_NONCE_SALT}"
