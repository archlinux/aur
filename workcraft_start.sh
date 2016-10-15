#!/bin/sh -e

CURRENT_DIR="$PWD"

cd "/opt/workcraft"
export CLASSPATH="$(ls -1 */build/libs/*.jar | tr '\n' ':')"
exec /usr/bin/java org.workcraft.Console -dir:"$CURRENT_DIR" "$@"
