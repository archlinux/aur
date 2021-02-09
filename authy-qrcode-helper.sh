#!/usr/bin/env bash
#
# Generate a QR code for each line of the source file.
#

SRC=$1

if [ -z $SRC ]; then
    echo 'No source file specified.'
    exit 1
fi

cat $SRC | while IFS= read -r line; do
    clear
    echo -n "$line" | qrencode -t UTF8
    read -p $"Press Enter to continue" key < /dev/tty
done
