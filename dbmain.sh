#!/bin/sh
if [ "x$1" != "x" ] && [ -f "$1" ] && [[  "$1" == *.lun ]]
then
  filepath="$(realpath "$1")"
fi

export DB_MAIN_BIN=/opt/dbmain/bin
export PATH=$DB_MAIN_BIN:$PATH
export LD_LIBRARY_PATH=$DB_MAIN_BIN:$DB_MAIN_BIN/../java/jre/lib/i386/client:$LD_LIBRARY_PATH
#CLASSPATH modification only for dbm-deasy-9xx-linux-setup.tar.gz
export CLASSPATH=.:$DB_MAIN_BIN/../plugins/deasy/lib/jidbmjava.jar:$DB_MAIN_BIN/../plugins/deasy/lib/sqlite-jdbc-3.6.20.1.jar:$CLASSPATH
cd $DB_MAIN_BIN

if [ "x$filepath" != "x" ]
then
  db_main $filepath
else
  db_main
fi
