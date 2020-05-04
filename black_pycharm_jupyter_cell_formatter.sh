#!/usr/bin/env bash
output=$(black -l 80 -S -c "$1"  2> /dev/null)
if [ $? -eq 0 ]; then
	echo "$output" | xsel -b
fi

