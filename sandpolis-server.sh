#!/bin/sh
exec /usr/bin/java -Dserver.path.db=/var/lib/sandpolis-server/db -Dserver.path.gen=/var/lib/sandpolis-server/gen -Dpath.log=/var/log/sandpolis-server -jar "/usr/share/java/sandpolis-server/sandpolis-server-vanilla-pkgver.jar" "$@"
