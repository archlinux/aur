#!/bin/bash

readonly joplin_dir="/usr/lib/node_modules/joplin/app/"

if [[ ! -d $joplin_dir ]]; then
    echo "Cannot find ${joplin_dir}"
    exit 1
fi

cd $joplin_dir

node main.js ${@}
