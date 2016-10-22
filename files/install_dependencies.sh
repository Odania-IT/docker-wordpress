#!/usr/bin/env sh
set -e

# Install base packages
apk update
apk upgrade
apk --update add curl wget bash htop vim msmtp bind-tools
apk --update add php5-apache2 php5-imagick php5-zlib php5-mysqli php5-gd php5-cli php5-json php5-openssl php5-xml php5-xmlreader php5-iconv php5-ctype

# Clean APK cache
rm -rf /var/cache/apk/*
