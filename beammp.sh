#!/bin/bash

data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/beammp"
system_launcher="/usr/lib/beammp/BeamMP-Launcher"
user_launcher="$data_dir/BeamMP-Launcher"

mkdir -p "$data_dir"

if [[ ! -x "$user_launcher" ]] ||
   ! cmp -s "$system_launcher" "$user_launcher"; then
    install -m755 "$system_launcher" "$user_launcher"
fi

cd "$data_dir" || exit 1
exec "$user_launcher" "$@"
