#!/bin/sh

dist=/usr/share/java/xxe/bin
jars="$dist/xerces.jar:$dist/resolver.jar:$dist/relaxng.jar:$dist/saxon.jar:$dist/saxon9.jar"
cp="$dist/xxe.jar:$jars"

# Disabled Java 9+ native HiDPI mode because the rendering of
# text and graphics is nicer using built-in HiDPI support:
# -Dsun.java2d.uiScale.enabled=false
# You may re-enable Java 9+ native HiDPI mode by removing 
# this option.

exec java -Xss4m -Xmx512m \
          -Dsun.java2d.uiScale.enabled=false \
          -Dawt.useSystemAAFontSettings=on \
          -Dswing.aatext=true \
          -DXXE_GUI="$XXE_GUI" \
          -DXXE_ADDON_PATH="$XXE_ADDON_PATH" \
          -DXXE_PREFS_DIR="$XXE_PREFS_DIR" \
          $XXE_JAVA_OPTS \
          -classpath "$cp" \
          com.xmlmind.xmleditapp.app.QuickStart "$@"
