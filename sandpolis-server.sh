#!/bin/sh
exec /usr/bin/java -Dpath.db=/var/lib/sandpolis-server/db -Dpath.gen=/var/lib/sandpolis-server/gen -Dpath.log=/var/log/sandpolis-server -jar "/usr/share/java/sandpolis-server/com.sandpolis.server.jar" "$@"
