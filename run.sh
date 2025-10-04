#!/bin/sh

epub_to_audiobook_dir=/opt/epub_to_audiobook

exec python3 "$epub_to_audiobook_dir/main.py" "$@"
