#!/usr/bin/env bash
set -e

sed -i 's#;sendmail_path =#sendmail_path = "/usr/bin/msmtp -t -i"#' /etc/php5/php.ini
