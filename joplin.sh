#!/bin/bash

readonly joplin_dir="/usr/share/joplin-cli"

cd $joplin_dir || exit 1

node main.js "${@}"
