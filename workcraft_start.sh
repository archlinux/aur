#!/bin/sh -e

CURRENT_DIR="$PWD"

cd "/opt/workcraft"
WORKCRAFT_HOME="$PWD"

export CLASSPATH="$WORKCRAFT_HOME/bin/*"
exec /usr/bin/java org.workcraft.Console -dir:"$CURRENT_DIR" "$@"
