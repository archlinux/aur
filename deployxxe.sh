#!/bin/sh

dist=/usr/share/java/xxe/bin
jars="$dist/xerces.jar:$dist/resolver.jar:$dist/relaxng.jar:$dist/saxon.jar:$dist/saxon9.jar"
cp="$dist/xxe_tool.jar:$dist/xxe.jar:$jars"

exec java -classpath "$cp" \
          -Djava.awt.headless=true \
          com.xmlmind.xmledittool.deploy.DeployTool "$@"
