#!/bin/sh
for name in /usr/share/java/textsecure-cli/*.jar ; do
	CP=$CP:"$name"
done
exec /usr/bin/java -cp "$CP" org.asamk.textsecure.Main "$@"
