#!/usr/bin/env bash
#
# Copyright (C) 2016  Samantha McVey <samantham@posteo.net>
# This file and project are licensed under the GPLv2 or greater at your choice.
# For more information view the license included license or visit:
# https://www.gnu.org/licenses/gpl-2.0.html
#
# This script will output two columns, first is the name of the program and last
# is the name of the file that has been deleted/replaced but is still in use by
# the program.

if [[ "$1" = "-h" || "$1" = "--help" ]]; then
	printf "ps-lsof outputs a list of processes whose files contents have been "
	printf "deleted or been changed on disk.\n    Only files whose old version's "
	printf "are still loaded into memory are shown.\n    Column 1 shows the "
	printf "processes and Column 2 shows the associated files.\n"
	printf "    ps-lsof does not accept any command line arguements except -h\n"
	exit 0
elif [[ ! "$1" = "" && ! "$1" = "-q" ]]; then
	printf "Unknown option! Try %s -h or --help to see help!\n" "${0}"
	exit 1
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
expressions+=("| sed -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' ")
expressions+=("-e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' -e 's/  */\t/' ")
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
