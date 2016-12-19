#!/bin/bash
#pwd | xclip -selection clipboard
#file=”thisfile.txt”
#echo “filename: ${file%.*}”
#echo “extension: ${file##*.}”
FILE=$1
echo $FILE " "|xclip -selection clipboard
# End Of Program
