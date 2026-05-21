#!/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -f /usr/share/java/fluxpass/fluxpass.jar ]; then
    exec java -jar /usr/share/java/fluxpass/fluxpass.jar "$@"
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
JAR="$SCRIPT_DIR/target/fluxpass.jar"

if [ ! -f "$JAR" ]; then
    echo "Building FluxPass..."
    cd "$SCRIPT_DIR" && mvn package -q
fi

exec java -jar "$JAR" "$@"
