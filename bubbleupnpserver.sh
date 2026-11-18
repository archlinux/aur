#!/bin/sh

# The launcher resolves the server JAR relative to its working directory.
cd /usr/share/java/bubbleupnpserver || exit 1

# Use 384 KiB per-thread stacks to avoid the stack overflows noted upstream.
# Headless AWT is required for image transcoding without a display server.
exec /usr/bin/java -Xss384k -Djava.awt.headless=true \
  -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 \
  -jar /usr/share/java/bubbleupnpserver/BubbleUPnPServerLauncher.jar \
  -disableAutoUpdate -ffmpegDir /usr/bin -youtubeDlpDir /usr/bin "$@"
