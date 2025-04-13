#!/bin/bash
ARGS="-Djna.nosys=true -Xmx1G -Dfile.encoding=UTF-8"
JVER=$(java -version 2>&1 | head -n1 | awk '{print $3}')
CJVER="${JVER//\"}"
SJVER="${CJVER%%.*}"
if [[ $SJVER -ge 9 ]]; then
	ARGS="$ARGS -XX:+IgnoreUnrecognizedVMOptions --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.lang.ref=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -javaagent:/usr/share/kemulator/KEmulator.jar"
fi
if [[ "$OSTYPE" == "darwin"* ]]; then
	ARGS="$ARGS -XstartOnFirstThread"
fi
if [ -z $1 ]
then
	cd /usr/share/kemulator
	java -Djava.library.path=$PWD $ARGS -jar KEmulator.jar -s
else
	FULL_JAR=$(realpath "$1")
	cd /usr/share/kemulator
	java -Djava.library.path=$PWD $ARGS -jar KEmulator.jar -jar "$FULL_JAR" -s
fi
