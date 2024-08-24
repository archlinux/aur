#!/bin/bash

if [[ $# -lt 4 ]]; then
	echo "$0: size input_file_name output_file_name input_uri"
	exit 255
fi

SIZE="$1"
INPUT_FILE_NAME="$2"
OUTPUT_FILE_NAME="$3"
INPUT_URI="$4"

covers=("$INPUT_FILE_NAME"/{.,}{folder,cover}.{jpg,png,svg})
for file in "${covers[@]}"; do
	if [[ -f "$file" ]]; then
		cover="$file"
		break
	fi
done

if [[ -z "$cover" ]] || ! convert -background none -thumbnail "$SIZE" "$cover" "$OUTPUT_FILE_NAME"; then
	gdbus call \
		--session \
		--dest org.freedesktop.thumbnails.Cache1 \
		--object-path /org/freedesktop/thumbnails/Cache1 \
		--method org.freedesktop.thumbnails.Cache1.Delete "['$INPUT_URI']" >/dev/null
fi
