#!/bin/sh

if [[ "$(archlinux-java get)" == java-8-* ]]; then
  exec /usr/bin/java -jar /usr/share/java/jabref/JabRef-VERSION.jar "$@"
else
  # Force usage of latest installed java 8
  JVM_PATH=$(find /usr/lib/jvm/java-8-* -maxdepth 0 -type d | sort | tail -n1)
  exec $JVM_PATH/jre/bin/java -jar /usr/share/java/jabref/JabRef-VERSION.jar "$@"
fi
