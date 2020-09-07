#!/usr/bin/env bash
set -ex

export DEBIAN_FRONTEND=noninteractive

echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
curl -L https://download.newrelic.com/548C16BF.gpg | apt-key add -
apt-get update
apt-get install -y newrelic-php5
