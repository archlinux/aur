#!/usr/bin/env sh
exec java -Dserver.port=8080 "$@" -jar /usr/share/java/exkeymo-web-*-jar-with-dependencies.jar
