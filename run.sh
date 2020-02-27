#!/bin/sh

# Fix low refresh interval when window is unfocused for Java 8 or higher
# See: https://bugs.openjdk.java.net/browse/JDK-8068529
exec /usr/bin/java -Dsun.java2d.xrender=false -jar \
	'/usr/share/java/llanfair/llanfair.jar' "$@"
