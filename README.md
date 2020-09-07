# Wordpress

This image is based on the official wrdpress image. It installs a few additional dependencies.

## Environment Variables

Newrelic plugin is preinstalled for php. Add these environment variables in order to use it:

NEW_RELIC_APP_NAME
NEW_RELIC_LICENSE_KEY
NEW_RELIC_LOG_FILE_NAME=STDOUT

For mail also set:

WORDPRESS_SMTP_HOST - SMTP host
WORDPRESS_SMTP_PORT - SMTP port
WORDPRESS_SMTP_USERNAME - SMTP username
WORDPRESS_SMTP_PASSWORD - SMTP password
WORDPRESS_SMTP_FROM - address from which emails are sent in wordpress
WORDPRESS_SMTP_FROM_NAME - name in wordpress emails

## Cli

The cli is not based on the same image due to that the user id do not match. The cli image here
is based on the same image and can be used without this problem.
