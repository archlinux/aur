#!/bin/sh
cd /opt/jisocreator
LOG_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/jisocreator/logs"
exec java -Dpath.logs="$LOG_DIR" --add-opens java.base/java.util=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -jar jisocreator.jar "$@"