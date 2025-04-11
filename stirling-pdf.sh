#!/usr/bin/sh

/usr/bin/unoserver --port 2003 --interface 127.0.0.1 &
/usr/bin/java -Dfile.encoding=UTF-8 -jar -Xmx512m /usr/share/java/stirling-pdf.jar
