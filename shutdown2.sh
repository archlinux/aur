#!/bin/bash
#
# Copyright (c) Orient Technologies LTD (http://www.orientechnologies.com)
#
# HISTORY:
# 2012-07-31: Added -w option
#
# 2015-10-08: modified John Radley (jradxl at gmail dot com) for use with Ubuntu and Manjaro systemd
#             added -t option, which checks whether the Server is running before trying to shutdown
#

# resolve links - $0 may be a softlink
PRG="$0"

#Test for no arguments (comment out if you need no arguments option)
if [ $# -eq 0 ]; then
	echo "usage: either -w | --wait and/or -t | --test"
    exit 1
fi

#Process the Arguments
while [[ $# > 0 ]]
do
  key="$1"
  case $key in
    -w|--wait)
      wait="yes"
    ;;
    -t|--test)
      test="test"
    ;;
    *)
	echo "usage: either -w | --wait and/or -t | --test"
	exit 1
    ;;
  esac
  shift 1
done

#Exit the script if Server is not running
if [ "x$test" = "xtest" ] ; then
  while true ; do
    ps -ef | grep java | grep $ORIENTDB_HOME/lib/orientdb-server > /dev/null || exit 0
	break;
  done
fi

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`

# Only set ORIENTDB_HOME if not already set
[ -f "$ORIENTDB_HOME"/bin/server.sh ] || ORIENTDB_HOME=`cd "$PRGDIR/.." ; pwd`
export ORIENTDB_HOME
cd "$ORIENTDB_HOME/bin"

if [ ! -f "${CONFIG_FILE}" ]
then
  CONFIG_FILE=$ORIENTDB_HOME/config/orientdb-server-config.xml
fi

# Set JavaHome if it exists
if [ -f "${JAVA_HOME}/bin/java" ]; then
   JAVA=${JAVA_HOME}/bin/java
else
   JAVA=java
fi
export JAVA

LOG_FILE=$ORIENTDB_HOME/config/orientdb-server-log.properties
LOG_LEVEL=warning
WWW_PATH=$ORIENTDB_HOME/www
JAVA_OPTS=-Djava.awt.headless=true

#Use the Server's shutdown comment
$JAVA -client $JAVA_OPTS \
-Dorientdb.config.file="$CONFIG_FILE" \
-cp "$ORIENTDB_HOME/lib/orientdb-tools-2.1.3.jar:$ORIENTDB_HOME/lib/*" com.orientechnologies.orient.server.OServerShutdownMain

#Wait for the Server to stop.
if [ "x$wait" = "xyes" ] ; then
  while true ; do
    ps -ef | grep java | grep $ORIENTDB_HOME/lib/orientdb-server > /dev/null || break
    sleep 1;
  done
fi

exit 0
