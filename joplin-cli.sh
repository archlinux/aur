#!/bin/bash

readonly joplin_dir="/usr/share/joplin-cli/"

if [[ ! -d $joplin_dir ]]; then
  echo "Did not found joplin data directory"
  exit 1
fi

cd $joplin_dir

node main.js ${@}
