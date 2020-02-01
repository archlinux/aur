#!/bin/bash

if [[ $# -lt 3 ]]; then
	echo "$0: size input_file_name output_file_name"
	exit 255
fi

SIZE="$1"
INPUT_FILE_NAME="$2"
OUTPUT_FILE_NAME="$3"
CHOPPED_FILE_NAME="/tmp/$(basename "$INPUT_FILE_NAME").chopped"

iFile=$(<"$INPUT_FILE_NAME")
iChopped="${iFile:0:1600}"
unset iFile
echo "${iChopped}" > "$CHOPPED_FILE_NAME"
unset iChopped
convert -size 210x290 -background white -pointsize 5 -border 10x10 -bordercolor "#CCC" caption:@"$CHOPPED_FILE_NAME" "$OUTPUT_FILE_NAME"
rm "$CHOPPED_FILE_NAME"
