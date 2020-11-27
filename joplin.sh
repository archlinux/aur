#!/usr/bin/env bash

readonly joplin_dir="/usr/share/joplin-desktop"

cd $joplin_dir || exit 1

./@joplinapp-desktop "$@"
