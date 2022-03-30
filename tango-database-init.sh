#!/usr/bin/env bash

_mysql_root='root'
_mysql_pass=''

_mysql_tango_user='tango'
_mysql_tango_pass='tango'

_mysql_client=/usr/bin/mysql

cd /usr/share/tango/db
$_mysql_client -u $_mysql_root --password=$_mysql_pass < tango-database-init.sql
$_mysql_client -u $_mysql_tango_user --password=$_mysql_tango_pass < create_db.sql
echo "ok."
