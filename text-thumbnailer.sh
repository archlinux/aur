#!/bin/bash

if [[ $# -lt 3 ]]; then
	echo "$0: size input_file_name output_file_name"
	exit 255
fi

SIZE="$1"
INPUT_FILE_NAME="$2"
OUTPUT_FILE_NAME="$3"
CHOPPED_FILE_CONTENT="$(head --lines=50 "$INPUT_FILE_NAME")"

convert -size ${SIZE}x${SIZE} -background white -pointsize 10 -border 5x5 -bordercolor "#CCC" caption:"$CHOPPED_FILE_CONTENT" "$OUTPUT_FILE_NAME"
