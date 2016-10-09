# Wordpress

This image sets up wordpress. It uses alpine and the apache server to serve the php files.


## Plugins

Some plugins are already installed.

## Config

The configuration can be done via environment variables:

      WORDPRESS_DB_NAME
      WORDPRESS_DB_USER
      WORDPRESS_DB_PASSWORD
      WORDPRESS_DB_HOST
      WORDPRESS_AUTH_KEY
      WORDPRESS_SECURE_AUTH_KEY
      WORDPRESS_LOGGED_IN_KEY
      WORDPRESS_NONCE_KEY
      WORDPRESS_AUTH_SALT
      WORDPRESS_SECURE_AUTH_SALT
      WORDPRESS_LOGGED_IN_SALT
      WORDPRESS_NONCE_SALT

You can generate the salt and keys here:
https://api.wordpress.org/secret-key/1.1/salt/

Note:
If you are using docker compose, remember to escape the $ sign with an extra $ https://docs.docker.com/compose/compose-file/#variable-substitution

