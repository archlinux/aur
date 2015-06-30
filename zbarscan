#!/bin/sh

if [ -z "${1}" ]; then
	echo "No file given." >&2
	exit 1
fi

if [ ! -s "${1}" ]; then
	echo "File '${1}' does not exist." >&2
	exit 1
fi

zenity --info --no-markup \
	--title="Scan with ZBar" \
	--icon-name="zbarscan" \
	--text="$(zbarimg --raw -q "${1}" || \
	echo "Failed to scan image file for code.")"
