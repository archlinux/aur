#!/bin/bash

# Minimum Java version required
MIN_VERSION=17

# Path to application
APP_HOME="/opt/Forge/"

ARCHLINUX_JAVA_PATH="/usr/lib/jvm/"

JAVA_BIN="/usr/bin/java"

JAVA_VER="$($JAVA_BIN --version 2>&1 | head -n1 | cut -d' ' -f2 | cut -d'.' -f1)"

JAVA_OK=0

JAR="$APP_HOME/forge-gui-desktop-__PKGVER__-jar-with-dependencies.jar"

if [[ "$JAVA_VER" -lt "$MIN_VERSION" ]]; then
    for subdir in "$ARCHLINUX_JAVA_PATH"/*/; do
        subdir="${subdir%/}"
        if [[ -x "$subdir/bin/java" ]]; then
            # Whuld be wierd if we dident find a java.. but who knows
            JAVA_VER="$("$subdir/bin/java" --version 2>&1 | head -n1 | cut -d' ' -f2 | cut -d'.' -f1)"

            if [[ "$JAVA_VER" -ge "$MIN_VERSION" ]]; then
                JAVA_BIN="$subdir/bin/java"
                JAVA_OK=1
                break
            fi
        fi
    done
fi

if [[ $JAVA_OK -eq 0 ]]; then
    echo "Failed to find a valid java of version 17"
    exit 1
fi

cd "$APP_HOME" || { echo "Failed to enter $APP_HOME"; exit 1; }

# Run your Java app
exec "$JAVA_BIN" -Xmx4096m -Dio.netty.tryReflectionSetAccessible=true -Dfile.encoding=UTF-8 -jar $JAR "$@"
