#!/bin/sh

app_dir='/opt/Fender/Studio Pro 8'
compat_dir="$app_dir/lib/ffmpeg8"

if [ -n "${LD_LIBRARY_PATH:-}" ]; then
  export LD_LIBRARY_PATH="$compat_dir:$LD_LIBRARY_PATH"
else
  export LD_LIBRARY_PATH="$compat_dir"
fi

exec "$app_dir/Studio Pro" "$@"
