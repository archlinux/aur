#!/bin/sh

DIR=`realpath ~/.local/share/epub_to_audiobook`

mkdir -p "$DIR"
cd "$DIR"

exec python /opt/epub_to_audiobook/main_ui.py $@
