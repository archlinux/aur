#!/bin/bash
# sl - prints a mirror image of ls. (C) 2017 Tobias Girstmair, https://gir.st/, GPLv3

LEN=$(ls "$@" |wc -L) # get the length of the longest line

ls "$@" | rev | while read -r line
do
	printf "%${LEN}.${LEN}s\\n" "$line" | sed 's/^\(\s\+\)\(\S\+\)/\2\1/'
done
