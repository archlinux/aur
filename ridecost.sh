#!/usr/bin/env bash
set -euo pipefail

JAVA_HOME="$(archlinux-java-run --min 17 --java-home)"
export JAVA_HOME

CLASSPATH='/usr/share/java/ridecost/*'

if [[ -f /usr/share/java/slf4j/slf4j-api.jar &&
      -f /usr/share/java/slf4j/slf4j-jdk-platform-logging.jar &&
      -f /usr/share/java/slf4j/slf4j-simple.jar ]]; then
  CLASSPATH+=":/usr/share/java/slf4j/slf4j-api.jar"
  CLASSPATH+=":/usr/share/java/slf4j/slf4j-jdk-platform-logging.jar"
  CLASSPATH+=":/usr/share/java/slf4j/slf4j-simple.jar"
fi

exec java -cp "$CLASSPATH" io.gitlab.vitalijr2.ridecost.cli.RideCost "$@"

