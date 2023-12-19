#!/bin/sh

for name in /usr/share/java/cdoc4j-util/*.jar
do
	CP=$CP:$name
done

exec /usr/bin/java -cp "$CP" -jar /usr/share/java/cdoc4j-util/cdoc4j-util.jar "$@"
