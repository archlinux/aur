#!/bin/bash

if [ $# -lt 5 ]
then
  echo "Usage: `basename $0` <pdf-file> <x_min> <x_max> <y_min> <y_max>"
  echo "Notes:"
  echo " - all coordinates are absolute; no calculation of width/height necessary"
  echo " - use 'gv' to determine the coordinates"
  exit 65
fi

file="$1"
xmin="$2"
xmax="$3"
ymin="$4"
ymax="$5"

base="${file%.*}"
outfile="${base}_cropped.pdf"

echo "writing to: $outfile"

gs \
  -o $outfile \
  -sDEVICE=pdfwrite \
  -c "[/CropBox [$xmin $ymin $xmax $ymax] /PAGES pdfmark" \
  -f $file
