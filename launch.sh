#!/bin/sh

# -Xss256k: thread stack size. 256K reduces per-thread memory usage and may prevent "java.lang.OutOfMemoryError: unable to create new native thread" on some systems
# -Djava.awt.headless=true: required for image transcoding to work on headless systems (eg no X-Window libraries)

exec java -Xss256k -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding="UTF-8" -jar /usr/share/bubbleupnpserver/BubbleUPnPServerLauncher.jar $*
