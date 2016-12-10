#!/bin/sh
PROGDIR=/usr/share/java/jsignpdf/
IFS='
'
exec java -cp $PROGDIR -jar $PROGDIR/JSignPdf.jar $*
