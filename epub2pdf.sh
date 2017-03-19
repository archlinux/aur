#!/bin/bash
$path=$(pwd)
cd /usr/share/java/epub2pdf/
/usr/sbin/java -jar /usr/share/java/epub2pdf/epub2pdf.jar $path$@
