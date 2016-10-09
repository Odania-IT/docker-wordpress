#FROM php:7.0-alpine
FROM alpine:3.4
MAINTAINER Mike Petersen <mike@odania-it.de>

ENV TERM vt100
ENV WORDPRESS_VERSION 4.6.1
ENV WORDPRESS_SHA1 027e065d30a64720624a7404a1820e6c6fff1202
ENV PLUGIN_VERSION_DOMAIN_MAPPING 0.5.5.1
ENV PLUGIN_VERSION_GOOGLE_XML_SITEMAPS 4.0.8
ENV PLUGIN_VERSION_JETPACK 4.3.1
ENV PLUGIN_VERSION_ALL_IN_ONE_SEO 2.3.9.2
ENV PLUGIN_CONTACT_FORM_7 7.4.5.1

COPY . /build

RUN /build/files/install_dependencies.sh

# Apache config
RUN /build/files/prepare_apache.sh

# Setup wordpress
RUN /build/files/prepare_wordpress.sh
COPY files/htaccess /srv/wordpress/.htaccess
COPY files/wp-config.php /srv/wp-config.php


# Scripts and entrypoint
COPY scripts /scripts
RUN mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

WORKDIR /srv
VOLUME /srv/wordpress
EXPOSE 80
ENTRYPOINT ["/scripts/run.sh"]
