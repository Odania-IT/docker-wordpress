FROM wordpress:5-php7.4-apache
MAINTAINER Mike Petersen <mike@odania-it.de>

COPY dist /
RUN /install-bin/install.sh
RUN /install-bin/install-newrelic.sh
