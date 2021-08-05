#!/usr/bin/bash

cd /opt/arthas

if [[ -n "$JAVA_HOME" && -d "$JAVA_HOME" ]]; then
  exec "$JAVA_HOME/bin/java" -jar arthas-boot.jar "$@"
else
  exec java -jar arthas-boot.jar "$@"
fi
