#!/bin/sh

dist=/usr/share/java/xxe/bin
jars="$dist/xerces.jar:$dist/resolver.jar:$dist/relaxng.jar:$dist/saxon.jar:$dist/saxon9.jar"
cp="$dist/xxe.jar:$jars"

exec java -Xss4m -Xmx512m \
          -Djava.awt.headless=true \
          -DXXE_ADDON_PATH="$XXE_ADDON_PATH" \
          -DXXE_PREFS_DIR="$XXE_PREFS_DIR" \
          -classpath "$cp" \
          com.xmlmind.xmleditapp.convert.StartConvert "$@"
