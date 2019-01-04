#!/bin/bash
savedfile=/var/tmp/compare-save-for-later.$USER
comparator=meld
if [ "$1" == "save" ]; then
	echo "$2" > "$savedfile"
else
	"$comparator" $(cat "$savedfile") "$2"
fi
