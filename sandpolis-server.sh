#!/bin/sh
exec /usr/bin/java -Dpath.db=/var/lib/sandpolis-server/db -Dpath.gen=/var/lib/sandpolis-server/gen -Dpath.log=/var/log/sandpolis-server --module-path /usr/share/java/sandpolis-server/lib -m com.sandpolis.server.vanilla/com.sandpolis.server.vanilla.Main "$@"
