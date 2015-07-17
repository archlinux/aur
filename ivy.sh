#!/bin/bash
#
# Runs Apache Ivy
#

if [ "$CLASSPATH" = "" ]; then
        CLASSPATH="/usr/share/java/apache-ivy/ivy.jar"
else
        CLASSPATH="/usr/share/java/apache-ivy/ivy.jar":$CLASSPATH
fi

exec "$JAVA_HOME/bin/java" -classpath $CLASSPATH $JAVA_OPTS org.apache.ivy.Main "$@"
