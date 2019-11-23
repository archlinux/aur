#!/bin/sh
exec /usr/bin/java -Dpath.log=/var/log/sandpolis-viewer-cli --module-path /usr/share/java/sandpolis-viewer-cli/lib -m com.sandpolis.viewer.cli/com.sandpolis.viewer.cli.Main "$@"