#!/bin/bash
clear

LIB="/usr/share/webapps/cakephp2/lib/Cake/Console/"
APP=`pwd`

exec php -q ${LIB}cake.php -working "${APP}" "$@"

exit
