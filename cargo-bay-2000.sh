#!/bin/sh
set -eu
cd /opt/cargo-bay-2000
read -r target < .launcher-target
exec "./$target" "$@"
