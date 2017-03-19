#!/bin/bash
currentpath=$(pwd)
cd /usr/share/java/epub2pdf/
for var1 in "$@"
do
    /usr/sbin/java -jar /usr/share/java/epub2pdf/epub2pdf.jar $currentpath/$var1
done
