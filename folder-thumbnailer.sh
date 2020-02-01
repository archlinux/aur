#!/bin/bash

if [[ $# -lt 4 ]]; then
	echo "$0: size input_file_name output_file_name input_uri"
	exit 255
fi

SIZE="$1"
INPUT_FILE_NAME="$2"
OUTPUT_FILE_NAME="$3"
INPUT_URI="$4"
THUMBNAIL="$(echo -n "$INPUT_URI" | md5sum | cut -d " " -f1).png"

convert_thumbnail() {
	local filename="$1"
	convert -background none -thumbnail "$SIZE" "$INPUT_FILE_NAME/$filename" "$OUTPUT_FILE_NAME" 1>/dev/null 2>&1
}

for directory in ".cache/thumbnails" ".thumbnails"; do
	for subdirectory in "normal" "large"; do
		rm -f "$HOME/$directory/$subdirectory/$THUMBNAIL"
	done
done

for name in "folder" "cover"; do
	for extension in "jpg" "png" "svg"; do
		if convert_thumbnail "${name}.${extension}" || convert_thumbnail ".${name}.${extension}"; then
			exit 0
		fi
	done
done

exit 1
