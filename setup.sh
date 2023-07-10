#!/bin/bash

root_dir="/opt/tModLoader"
user_dir="$HOME/.local/share/tModLoader"

root_version_file="$root_dir/ver.txt"
user_version_file="$user_dir/ver.txt"

install_needed=false

if [[ ! -e "$user_dir" ]]
then
  mkdir -p "$user_dir"
  install_needed=true
elif [[ "$(cat "$root_version_file")" != "$(cat "$user_version_file")" ]]
then
  install_needed=true
fi

if [[ $install_needed == true ]]
then
  pack_file="$root_dir/tml.zip"

  echo -n "Extracting tModLoader..."
  unzip -X -o "$pack_file" -d "$user_dir/"
  cp "$root_version_file" "$user_version_file"
  echo "Done"

  echo -n "Enabling scripts..."
  chmod +x "$user_dir/start-"*".sh"
  echo "Done"
fi
