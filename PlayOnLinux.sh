#!/bin/bash

POL_HOME=/opt/playonlinux5
CLASSPATH=${CLASSPATH}:$POL_HOME/lib/*

# Allow either openjdk java or Oracle java to be used

if (( $(archlinux-java get | cut -d "-" -f2) < 8 )); then
  export PATH=$(ls -d /usr/lib/jvm/java-{8,9}-* 2>/dev/null | head -1):$PATH
fi

# Start PlayOnLinux
java -classpath "$CLASSPATH" org.phoenicis.javafx.JavaFXApplication "$@"
