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
    cd /srv/wordpress/wp-content/plugins
    wget https://downloads.wordpress.org/plugin/$1
    unzip $1
    rm -f $1
}

# wordpress mu domain mapping
install_plugin wordpress-mu-domain-mapping.${PLUGIN_VERSION_DOMAIN_MAPPING}.zip
cp /srv/wordpress/wp-content/plugins/wordpress-mu-domain-mapping/sunrise.php /srv/wordpress/wp-content/sunrise.php

# google xml sitemaps
install_plugin google-sitemap-generator.${PLUGIN_VERSION_GOOGLE_XML_SITEMAPS}.zip

# Jetpack
install_plugin jetpack.${PLUGIN_VERSION_JETPACK}.zip

# All in one SEO pack
install_plugin all-in-one-seo-pack.${PLUGIN_VERSION_ALL_IN_ONE_SEO}.zip

# Contact Form 7
install_plugin contact-form-${PLUGIN_CONTACT_FORM_7}.zip

# iThemes Security
install_plugin better-wp-security.5.6.2.zip

# Updraft Plus (Backup)
install_plugin updraftplus.1.12.23.zip

# Ninja Forms
install_plugin ninja-forms.3.0.7.zip

# WP Mail Smtp
install_plugin wp-mail-smtp.0.9.6.zip

# Wpoptimize
install_plugin wp-optimize.1.9.1.zip

# Broken Links Checker
install_plugin broken-link-checker.1.11.2.zip

# WP Statistics
install_plugin wp-statistics.10.3.zip

# Disqus Comment System
install_plugin disqus-comment-system.2.86.zip

# SEO Friendly Images
install_plugin seo-image.zip

# Share Buttons by AddThis
install_plugin addthis.5.3.4.zip

# Activate Update Services (Reenable pinging update services for new posts)
install_plugin activate-update-services.1.0.7.zip

chown -R apache:apache /srv
