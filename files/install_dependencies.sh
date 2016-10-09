#!/usr/bin/env sh
# Install base packages
apk update
apk upgrade
apk --update add curl wget bash htop vim
apk --update add php5-apache2 php5-imagick php5-zlib php5-mysqli php5-gd php5-cli php5-json php5-openssl

# Clean APK cache
rm -rf /var/cache/apk/*
