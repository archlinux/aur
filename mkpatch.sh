#!/bin/sh

if [ $# != "1" ]; then
    echo "$0 SOURCE_PATH"
    exit 1
fi

HERE=$(cd "$(dirname "$0")"; pwd -P || exit 1)
SOURCE_PATH=$1; shift
cd "$SOURCE_PATH" || exit 1

for n in $(find . -iname "*.orig"); do
    FILENAME="${n%%.orig}"
    PATCHNAME=patch"$(printf "%s" "$FILENAME" | tr -sc "[0-9a-zA-Z]" "_")".patch
    echo "Generating $PATCHNAME..."
    diff -u "$n" "$FILENAME" > "$HERE/$PATCHNAME"
done
