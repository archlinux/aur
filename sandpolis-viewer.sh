#!/bin/sh
exec /usr/bin/java -Dpath.log=/var/log/sandpolis-viewer --module-path /usr/share/java/sandpolis-viewer/lib -m com.sandpolis.viewer.jfx/com.sandpolis.viewer.jfx.Main "$@"