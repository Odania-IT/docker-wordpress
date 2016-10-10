#!/usr/bin/env bash
cp /etc/msmtp.template /etc/msmtp


# see http://stackoverflow.com/a/2705678/433558
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
	sed -ri -e "s/$1/$(sed_escape_rhs "$(php_escape "$value" "$var_type")")/"  /etc/msmtp
}

set_config 'MAIL_HOST' "${MAIL_HOST}"
set_config 'MAIL_PORT' "${MAIL_PORT}"
set_config 'MAIL_USER' "${MAIL_USER}"
set_config 'MAIL_PASSWORD' "${MAIL_PASSWORD}"
