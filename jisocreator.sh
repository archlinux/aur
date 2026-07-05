#!/bin/sh
java_version_number=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
if (( java_version_number < 21 )); then
    notify-send "Cannot start, Java version too low" "Java runtime must be version 21 or greater, current default version is $java_version_number" --app-name="JISOCreator" -i /usr/share/pixmaps/jisocreator.png
else
    cd /opt/jisocreator
    LOG_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/jisocreator/logs"
    exec java -Dpath.logs="$LOG_DIR" --add-opens java.base/java.util=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -jar jisocreator.jar "$@"
fi
