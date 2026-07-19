#!/bin/sh
java_version=$(java -version 2>&1 | awk -F'"' '/version/ {print $2}' | cut -d. -f1)
if [ "$java_version" -ge 17 ] 2>/dev/null; then
    exec /usr/bin/java --enable-native-access=ALL-UNNAMED -jar '/usr/share/java/stsw-link007/STLinkUpgrade.jar' "$@"
else
    exec /usr/bin/java -jar '/usr/share/java/stsw-link007/STLinkUpgrade.jar' "$@"
fi
