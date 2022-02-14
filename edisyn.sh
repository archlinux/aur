#!/bin/sh -e

JAVA_DIR="/usr/share/java"

exec /usr/bin/java -jar "$JAVA_DIR"/edisyn/edisyn.jar "$@"
