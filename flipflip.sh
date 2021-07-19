#!/bin/bash

readonly ff_dir="/usr/share/flipflip/"

if [[ ! -d $ff_dir ]]; then
  echo "Cannot find /usr/share/flipflip/"
  exit 1
fi

cd $ff_dir

./FlipFlip "$@"