#!/bin/sh

MYSELF=`which "$0" 2>/dev/null`
[ $? -gt 0 -a -f "$0" ] && MYSELF="./$0"

java=java
if test -n "$JAVA_HOME"; then
    java="$JAVA_HOME/bin/java"
fi

java_args="--enable-native-access=ALL-UNNAMED --add-opens=java.desktop/com.sun.media.sound=ALL-UNNAMED"

exec "$java" $java_args -jar $MYSELF "$@"

exit 1
