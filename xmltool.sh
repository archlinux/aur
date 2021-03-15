#!/bin/sh

dist=/usr/share/java/xxe/bin/
config_dir="/usr/share/java/xxe/addon/config"

jars="$dist/xerces.jar:$dist/resolver.jar:$dist/relaxng.jar"
jars="$config_dir/common/xhtml.jar:$jars"
cp="$dist/xxe.jar:$jars"

c1="$config_dir/catalog.xml"
c2="$config_dir/dita/catalog.xml"
c3="$config_dir/docbook/catalog.xml"
c4="$config_dir/xhtml/catalog.xml"
c5="$config_dir/docbook5/catalog.xml"
c6="$config_dir/docbook51/catalog.xml"
if [ -f "$c1" ]; then
    XML_CATALOG_FILES="$c1;$c2;$c3;$c4;$c5;$c6;$XML_CATALOG_FILES"
    export XML_CATALOG_FILES
fi

exec java -Xss4m -Xmx512m \
          -Dxml.catalog.files="$XML_CATALOG_FILES" \
          -classpath "$cp:$CLASSPATH" \
          com.xmlmind.xml.xmltool.Main "$@"
