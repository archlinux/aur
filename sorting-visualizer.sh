#!/bin/sh

MYSELF=`which "$0" 2>/dev/null`
[ $? -gt 0 -a -f "$0" ] && MYSELF="./$0"

java=java
if test -n "$JAVA_HOME"; then
    java="$JAVA_HOME/bin/java"
fi

java_args="--add-modules javafx.swing,javafx.controls"
if [ -f "/etc/profile.d/java-openjfx-profile.sh" ] ; then
    source "/etc/profile.d/java-openjfx-profile.sh"
    if test -n "$OPENJFX_MODULES_PATH"; then
        java_args="$OPENJFX_JAVA_OPTIONS $java_args"
    fi
fi

exec "$java" $java_args -jar $MYSELF "$@"

exit 1
