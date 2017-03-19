#!/bin/bash
$1=$(pwd)
cd /usr/share/java/epub2pdf/
/usr/sbin/java -jar /usr/share/java/epub2pdf/epub2pdf.jar $1$@
