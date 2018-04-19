#!/bin/bash

readonly joplin_dir="/usr/share/joplin/"

if [[ ! -d $joplin_dir ]]; then
  echo "Did not found joplin data directory"
  exit 1
fi

cd $joplin_dir

./joplin "$@"

