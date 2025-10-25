#!/bin/sh
set -eu
cd /usr/share/forge-gui-desktop
exec /usr/bin/java -Xmx4096m \
  -Dio.netty.tryReflectionSetAccessible=true \
  -Dfile.encoding=UTF-8 \
  -jar /usr/share/java/forge-gui-desktop.jar "$@"
