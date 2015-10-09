#!/bin/bash
#
# Copyright (c) Orient Technologies LTD (http://www.orientechnologies.com)
#
#
# HISTORY:
# 2015-10-08: modified John Radley (jradxl at gmail dot com) for use with Manjaro and Ubuntu systemd.
#             removed the "exec" as this was causing systemd to report a failure on shutdown.
#             added test to abort script is a server is already running.
#

if [[ $(id -u) -eq 0 ]] ; then
  echo "Please do not try to start Orientdb Server as root." ;
  exit 1;
fi

# resolve links - $0 may be a softlink
PRG="$0"

#Exit the script if a Server is running
while true ; do
    ps -ef | grep java | grep $ORIENTDB_HOME/lib/orientdb-server > /dev/null || break
	echo Server is already running.
	exit 0;
done

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
	echo $PRG
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

# Raspberry Pi check (Java VM does not run with -server argument on ARMv6)
if [ `uname -m` != "armv6l" ]; then
  JAVA_OPTS="$JAVA_OPTS -server "
fi
export JAVA_OPTS

# Set JavaHome if it exists
if [ -f "${JAVA_HOME}/bin/java" ]; then
   JAVA=${JAVA_HOME}/bin/java
else
   JAVA=java
fi
export JAVA

LOG_FILE=$ORIENTDB_HOME/config/orientdb-server-log.properties
WWW_PATH=$ORIENTDB_HOME/www
ORIENTDB_SETTINGS="-Dprofiler.enabled=true"
JAVA_OPTS_SCRIPT="-Djna.nosys=true -XX:+HeapDumpOnOutOfMemoryError -Djava.awt.headless=true -Dfile.encoding=UTF8 -Drhino.opt.level=9"

# ORIENTDB MAXIMUM HEAP. USE SYNTAX -Xmx<memory>, WHERE <memory> HAS THE TOTAL MEMORY AND SIZE UNIT. EXAMPLE: -Xmx512m
MAXHEAP=-Xmx512m
# ORIENTDB MAXIMUM DISKCACHE IN MB, EXAMPLE, ENTER -Dstorage.diskCache.bufferSize=8192 FOR 8GB
MAXDISKCACHE="-Dstorage.diskCache.bufferSize=512"

#Original, commented out
#exec "$JAVA" $JAVA_OPTS $MAXHEAP $JAVA_OPTS_SCRIPT $ORIENTDB_SETTINGS $MAXDISKCACHE -Djava.util.logging.config.file="$LOG_FILE" \
#-Dorientdb.config.file="$CONFIG_FILE" -Dorientdb.www.path="$WWW_PATH" -Dorientdb.build.number="0" \
#-cp "$ORIENTDB_HOME/lib/orientdb-server-2.1.3.jar:#$ORIENTDB_HOME/lib/*" $* com.orientechnologies.orient.server.OServerMain

#Modified, "exec" has been removed as causing a systemd error message on shutdown
$JAVA $JAVA_OPTS $MAXHEAP $JAVA_OPTS_SCRIPT $ORIENTDB_SETTINGS $MAXDISKCACHE \
-Djava.util.logging.config.file="$LOG_FILE" \
-Dorientdb.config.file="$CONFIG_FILE" \
-Dorientdb.www.path="$WWW_PATH" \
-Dorientdb.build.number="0" \
-cp "$ORIENTDB_HOME/lib/orientdb-server-2.1.3.jar:$ORIENTDB_HOME/lib/*" com.orientechnologies.orient.server.OServerMain

exit 0
