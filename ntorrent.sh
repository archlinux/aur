#!/bin/bash

CP="."
for name in /usr/share/java/ntorrent/*.jar ; do
	CP="$CP:$name"
done

cd /usr/share/ntorrent
java -cp "$CP" org.java.plugin.boot.Boot "$@"
