#!/bin/sh -e
for jar in /usr/share/java/tantrix/*.jar; do
	CP=$CP:$jar
done
exec /usr/bin/java -cp $CP util.JWSApplication "$@"
