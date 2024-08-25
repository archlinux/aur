#!/bin/bash

if [[ $# -lt 3 ]]; then
	echo "$0: size input_file_name output_file_name"
	exit 255
fi

SIZE="$1"
INPUT_FILE_NAME="$2"
OUTPUT_FILE_NAME="$3"

if TMP_DIR="$(mktemp --directory --tmpdir tumbler-stl-XXXXXX)"; then
	cp "$INPUT_FILE_NAME" "$TMP_DIR/source.stl"
	echo 'import("source.stl", convexity=10);' > "$TMP_DIR/thumbnail.scad"
	openscad --imgsize "500,500" -o "$TMP_DIR/thumbnail.png" "$TMP_DIR/thumbnail.scad" 2>/dev/null
	convert -thumbnail "$SIZE" "$TMP_DIR/thumbnail.png" "$OUTPUT_FILE_NAME" &>/dev/null
	rm -rf "$TMP_DIR"
	exit 0
else
	exit 1
fi
