#!/bin/env bash
#
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This project and this file are licensed with the GPLv2 or greater, at your choice.
#
# This script will output two columns, first is the name of the program and last
# is the name of the file that has been deleted/replaced but is still in use by the program

if [ "$1" = "-h" ]; then
	echo "ps-lsof outputs a list of processes whose files contents have been deleted or been changed on disk."
	echo "    Only files whose old version's are still loaded into memory are shown."
	echo "    Column 1 shows the processes and Column 2 shows the associated files."
	echo "    ps-lsof does not accept any command line arguements except -h"
	exit 0
fi

# Get a list of process-id's, one on each line
expressions+=("pgrep . ")
# Use xargs to run lsof for each process-id and pipe errors to /dev/null
# -P means don't resolve ports, +c 0 means have no max length for filenames
# -n means don't resolve hostnames, -w means supress errors
expressions+=("| xargs -P 1 -I '{}' lsof -P +c 0 -n -w +p '{}' 2> /dev/null ")
# Only grep files that have been deleted
expressions+=("| grep \" DEL \" ")
# Remove things that are not normal files
expressions+=("| grep -vE \" /dev| /run| /drm | /SYSV.*$| /memfd| /\[aio\]\" ")
# Replace first 7 occurances of spaces with tabs
expressions+=("| sed -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' ")
expressions+=("| cut -f 1,8 | sort -u")
OUTPUT=$(eval "${expressions[@]}")

# If there's no output, don't print anything
if [ "$OUTPUT" = "" ]; then
	exit 0
elif [ "${1}" = "-q" ]; then
	printf "%s\n" "$OUTPUT" | column -t
	exit 0
else
	printf "PROCESS FILENAME\n%s\n" "$OUTPUT" | column -t
	exit 0
fi
