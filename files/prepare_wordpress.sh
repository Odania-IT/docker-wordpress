#!/usr/bin/env bash

cd /srv

curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"
echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
tar -xzf wordpress.tar.gz -C /srv
rm wordpress.tar.gz

# Plugins
cd /srv/wordpress/wp-content/plugins
function install_plugin {
	echo "Installing Plugin $1"
	cd /srv/wordpress/wp-content/plugins
	wget https://downloads.wordpress.org/plugin/$1
	unzip $1
	rm -f $1
}

while read -u 10 plugin; do
	if [[ "$plugin" =~ ^#.* ]] || [[ "$plugin" = "" ]]; then
		 continue
	fi

	install_plugin $plugin
done 10</data/plugins.txt

# Themes
function install_theme {
	echo "Installing Theme $1"
	cd /srv/wordpress/wp-content/themes/
	wget https://downloads.wordpress.org/theme/$1
	unzip $1
	rm -f $1
}
while read -u 10 plugin; do
	if [[ "$plugin" =~ ^#.* ]] || [[ "$plugin" = "" ]]; then
		 continue
	fi

	install_theme $plugin
done 10</data/themes.txt


# wordpress mu domain mapping <- Setup
cp /srv/wordpress/wp-content/plugins/wordpress-mu-domain-mapping/sunrise.php /srv/wordpress/wp-content/sunrise.php

chown -R apache:apache /srv
