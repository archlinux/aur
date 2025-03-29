#!/bin/sh -e

JAVA_SHARE_DIR="/usr/share/java"
export JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS:--Dsun.java2d.opengl=true}"

if [[ -z "$JAVA_ENV_NAME" ]]; then
    for env in java-24-openjdk java-21-openjdk; do
        if [[ -d /usr/lib/jvm/$env ]]; then
            JAVA_ENV_NAME=$env
            break
        fi
    done
fi

if [[ ! -x "/usr/lib/jvm/$JAVA_ENV_NAME/bin/java" ]]; then
    echo "No suitable Java environment found." > /dev/stderr
    echo "Please install latest jre-openjdk package." > /dev/stderr
    exit 1
fi

exec /usr/lib/jvm/$JAVA_ENV_NAME/bin/java -jar "$JAVA_SHARE_DIR"/edisyn/edisyn.jar "$@"
