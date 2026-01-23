#!/usr/bin/env bash

# EasyPostman launcher script for Arch Linux

# Java options for optimal performance
JAVA_OPTS=(
    "-Xms512m"
    "-Xmx1g"
    "-XX:MaxMetaspaceSize=256m"
    "-XX:MetaspaceSize=128m"
    "-XX:MaxDirectMemorySize=256m"
    "-XX:+UseG1GC"
    "-XX:MaxGCPauseMillis=200"
    "-XX:InitiatingHeapOccupancyPercent=45"
    "-XX:+UseStringDeduplication"
    "-XX:+HeapDumpOnOutOfMemoryError"
    "-XX:HeapDumpPath=${HOME}/.local/share/easypostman/dumps"
    "-Dfile.encoding=UTF-8"
    "-Dawt.useSystemAAFontSettings=on"
    "-Dswing.aatext=true"
    "-Djava.net.preferIPv4Stack=true"
    "-Dhttp.keepAlive=true"
    "--add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED"
)

# Create dump directory if it doesn't exist
mkdir -p "${HOME}/.local/share/easypostman/dumps"

# Find Java executable
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then
    JAVA="$JAVA_HOME/bin/java"
elif command -v java &>/dev/null; then
    JAVA="java"
else
    echo "Error: Java 17 or higher is required but not found."
    echo "Please install java-runtime>=17 package."
    exit 1
fi

# Check Java version
JAVA_VERSION=$("$JAVA" -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
if [ "$JAVA_VERSION" -lt 17 ] 2>/dev/null; then
    echo "Error: Java 17 or higher is required. Found version: $JAVA_VERSION"
    exit 1
fi

# Run EasyPostman
exec "$JAVA" "${JAVA_OPTS[@]}" -jar /usr/share/java/easypostman/easypostman.jar "$@"
