#!/bin/sh
DAVMAIL_HOME=/usr/share/java/davmail
exec "$JAVA_HOME/bin/java" -jar "$DAVMAIL_HOME/davmail.jar" "$@"
