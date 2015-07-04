#!/bin/sh
 
filename=$(ls "$1" | sed 's/\(.*\)\..*/\1/')
 
if [ "" = "$filename" ]
then
  echo "Datei nicht gefunden. Ende."
  exit 1
fi
 
tempname="/tmp/pdf2book"
 
pdf2ps "$filename.pdf" "$tempname.1.ps"
 
if [ "$2" = "" ]
  then psbook -q "$tempname.1.ps" "$tempname.2.ps";
  else psbook -q -s$2 "$tempname.1.ps" "$tempname.2.ps";
fi
 
psnup -q -2 "$tempname.2.ps" "$tempname.1.ps"
 
ps2pdf "$tempname.1.ps" "$filename.book.pdf"