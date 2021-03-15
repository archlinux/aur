#!/bin/sh

dist=/usr/share/java/xxe/bin
jars="$dist/xerces.jar:$dist/resolver.jar:$dist/relaxng.jar:$dist/saxon.jar:$dist/saxon9.jar"
cp="$dist/xxe.jar:$jars"

# Adding -Djava.awt.headless=true below seems to work.
# However this is not officially supported by XMLmind Software yet.

exec java -Xss4m -Xmx512m \
    -Djava.awt.headless=true \
    -Dawt.useSystemAAFontSettings=on \
    -Dswing.aatext=true \
    -DXXE_GUI="$XXE_GUI" \
    -DXXE_ADDON_PATH="$XXE_ADDON_PATH" \
    -DXXE_PREFS_DIR="$XXE_PREFS_DIR" \
    -classpath "$cp" \
    com.xmlmind.xmleditapp.tool.StartTool "$@"
