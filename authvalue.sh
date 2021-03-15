#!/bin/sh

dist=/usr/share/java/xxe/bin
cp="$dist/xxe.jar"

exec java -classpath "$cp" \
          com.xmlmind.netutil.SimpleAuthenticatorModule "$@"
