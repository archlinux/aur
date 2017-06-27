#!/bin/sh

cd /usr/share/java/tvbrowser/

if [[ "$(archlinux-java get)" == java-8-* ]]; then
  exec /usr/bin/java -jar tvbrowser.jar -ignorejvm "$@"
else
  # Force usage of latest java version
  JVM_PATH=$(find /usr/lib/jvm/* -maxdepth 0 -type d | sort | tail -n1)
  exec $JVM_PATH/jre/bin/java -jar tvbrowser.jar -ignorejvm "$@"
fi
