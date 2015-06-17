#!/bin/bash
clear

LIB="/usr/share/webapps/cakephp/cake/console/"
APP=`pwd`

exec php -q ${LIB}cake.php -working "${APP}" "$@"

exit
