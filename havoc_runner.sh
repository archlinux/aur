#!/usr/bin/env bash

# check if the havoc binary exists in the specified directory
if [[ -x /opt/Havoc/havoc ]]; then
  # save the current directory to return later
  original_dir=$(pwd)

  # change directory to /opt/Havoc and execute havoc binary with all the arguments
  pushd /opt/Havoc > /dev/null
  ./havoc "$@"

  # return to the original directory
  popd > /dev/null
else
  echo "havoc binary not found in /opt/Havoc"
  exit 1
fi
