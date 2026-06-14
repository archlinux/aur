#!/bin/sh
set -eu

home=${HOME:-/tmp}
data_home=${XDG_DATA_HOME:-"$home/.local/share"}
user_dir=${WACKI_USER_DIR:-"$data_home/wacki"}
system_data_dir=/usr/share/wacki/data

mkdir -p "$user_dir"
cd "$user_dir"

if [ -z "${WACKI_PATH:-}" ]; then
    export WACKI_PATH="$system_data_dir"
fi

exec /usr/lib/wacki/wacki "$@"
