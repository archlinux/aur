#!/bin/sh
set -euo pipefail
cd /usr/share/forge-gui-desktop
exec /usr/bin/java -Xmx4096m -jar /usr/share/java/forge-adventure-editor.jar "$@"
