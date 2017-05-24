#!/bin/sh

JAVA_EXEC=""
APP_ARGS=""

if [ -n "$JAVA_HOME" ]; then
  if [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA_EXEC="$JAVA_HOME/bin/java"
  fi
else
  JAVA_EXEC="$(which java)"
fi

if [ -z "$JAVA_EXEC" ]; then
  echo "No 'java' executable can be found, please set JAVA_HOME variable or"
  echo "use the 'archlinux-java' script to set the Java version."
  exit 1
fi

if [ $# -gt 0 ]
then
  APP_ARGS="-open"
fi

"$JAVA_EXEC" -jar /usr/share/java/sweethome3d.jar "$APP_ARGS" "$@"
