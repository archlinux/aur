#!/bin/sh

# This file is a part of remixed-dungeon ArchLinux package
# It is a startup script for Remixed Dungeon game
#
set -eux

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
pkg=remixed-dungeon
opt_root="/opt/${pkg}"

lwjgl_path="/tmp/${pkg}/${USER}/lwjgl-natives"
mkdir -p "$lwjgl_path"

share_dir="${HOME}/.local/share/${pkg}"
workdir="$share_dir"
mkdir -p "$workdir"

# Symlink read-only assets to working directory
ln -sfn "${opt_root}/data" "${workdir}/data"
ln -sfn "${opt_root}/data/mods" "${workdir}/mods"

cd "$workdir"

exec "${JAVA_HOME}/bin/java" \
  --add-opens java.base/java.util=ALL-UNNAMED \
  -Dassets.dir="${opt_root}/data" \
  -Duser.home="$HOME" \
  -Dorg.lwjgl.librarypath="$lwjgl_path" \
  -Dsun.java2d.opengl=true \
  -Dsun.java2d.xrender=true \
  -jar "${opt_root}/bin/remixed-dungeon.jar" \
  "$@"
