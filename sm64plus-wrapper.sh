#!/usr/bin/bash

set -eu

config_dir=${XDG_CONFIG_HOME:-~/.config}/sm64plus
mkdir -p "$config_dir"
cd "$config_dir"
exec /opt/sm64plus/sm64.us.f3dex2e /opt/sm64plus/gfx
