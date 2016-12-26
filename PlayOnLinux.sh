#!/bin/bash

POL_HOME=/opt/playonlinux5
CLASSPATH=${CLASSPATH}:$POL_HOME/lib/*

if [[ $(archlinux-java get | cut -d "-" -f2) -ge 8 ]]; then
	export JAVA_HOME=$(archlinux-java get)
else
	export JAVA_HOME=$(ls /usr/lib/jvm/java-{8,9}-*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
fi

java -classpath "$CLASSPATH" com.playonlinux.javafx.JavaFXApplication "$@"
