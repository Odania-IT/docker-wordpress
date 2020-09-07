FROM wordpress:5-php7.4-apache
MAINTAINER Mike Petersen <mike@odania-it.de>

ADD bin/install.sh /install.sh
RUN /install.sh
