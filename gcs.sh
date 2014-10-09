#!/bin/sh
if ! "$JAVA_HOME/bin/java" -version 2>&1 | grep 'version "1.8' >/dev/null
then
	echo "GURPS character sheet requires Java 8" >&2
	exit 1
fi
GCS_HOME=/usr/share/gcs exec "$JAVA_HOME/bin/java" -jar '/usr/share/java/gcs/gcs.jar' "$@"
