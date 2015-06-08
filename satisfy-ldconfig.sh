#!/bin/sh

path="$1"
name=`basename "$path"`

mv "$path" "$path.0.0.0"
chmod +x "$path.0.0.0"

rm -f "$path"
rm -f "$path.0"

ln -s "$name.0.0.0" "$path"
ln -s "$name.0.0.0" "$path.0"
