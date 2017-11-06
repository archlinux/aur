
setup() {
  #ln -s /usr/share/webapps/esniper /srv/http/

  # enable extension=pdo_mysql.so in file /etc/php/php.ini
  # systemctl restart php-fpm

  DBNAME=root
  DBUSER=root
  DBPASS=root

  printf "Input Database(MySQL) Username:"
  read tmp
  if test -n "$tmp"; then
    DBUSER="$tmp"
  fi
  printf "Input Database(MySQL) Password:"
  read tmp
  if test -n "$tmp"; then
    DBPASS="$tmp"
  fi
  DBNAME="${DBUSER}"

  sed -i "s/\"EZSQL_DB_NAME\", \"snyp\"/\"EZSQL_DB_NAME\", \"$DBNAME\"/g" /usr/share/webapps/esniper/config.inc.php
  sed -i "s/\"EZSQL_DB_USER\", \"snyp\"/\"EZSQL_DB_USER\", \"$DBUSER\"/g" /usr/share/webapps/esniper/config.inc.php
  sed -i "s/\"EZSQL_DB_PASSWORD\", \"snyp\"/\"EZSQL_DB_PASSWORD\", \"$DBPASS\"/g" /usr/share/webapps/esniper/config.inc.php

  chmod 700 /usr/share/webapps/esniper/config.inc.php
  chown http:http /usr/share/webapps/esniper/config.inc.php


  cp /usr/share/webapps/esniper/install/esniper.sql /tmp/tmp-esniper-db.sql
  sed -e "s|# phpMyAdmin SQL Dump|CREATE DATABASE IF NOT EXISTS ${DBNAME};\nuse ${DBNAME};\n|g" \
      -i /tmp/tmp-esniper-db.sql

  mysql -h localhost -u$DBUSER -p$DBPASS < /tmp/tmp-esniper-db.sql
}

setup

