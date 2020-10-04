#!/usr/bin/env bash

readonly joplin_dir="/usr/share/joplin"

cd $joplin_dir || exit 1

./joplin "$@"
