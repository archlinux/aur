#!/bin/sh

JAVA_EXEC=""

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

"$JAVA_EXEC" -jar /usr/share/java/telegram_backup.jar "$@"
