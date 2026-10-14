#!/bin/bash
# GulchCE keeps config.toml, maps/, its log and its screenshots beside its
# executable, and copies maps/ there from the disc image at the first start.
# /usr/lib/gulchce is not writable, so each user runs a copy of the game from
# a folder of their own, which also holds their saves.
set -eu

libdir=/usr/lib/gulchce
userdir=${XDG_DATA_HOME:-$HOME/.local/share}/gulchce

mkdir -p "$userdir"

# Refresh the copy when the package's executable changes (an update or a
# downgrade). The running game keeps its old file: mv replaces the name only.
stamp() { stat -Lc '%s %Y' "$1" 2>/dev/null || true; }
if [[ $(stamp "$libdir/halo") != "$(stamp "$userdir/halo")" ]]; then
    cp --preserve=mode,timestamps "$libdir/halo" "$userdir/.halo.new"
    mv -f "$userdir/.halo.new" "$userdir/halo"
fi

# The game loads the SDL3 beside it, which must be the package's.
ln -sfn "$libdir/libSDL3.so.0" "$userdir/libSDL3.so.0"

# The MQTT brokers of internet play follow the package's list. Replace the
# link with a file to keep a list of your own.
if [[ ! -e $userdir/brokers.txt && ! -L $userdir/brokers.txt ]]; then
    ln -s "$libdir/brokers.txt" "$userdir/brokers.txt"
fi

# A first config.toml: saves, profiles and the map cache go in saves/ here,
# not ~/.local/share/halo-linux, and the game does not update itself (pacman
# updates it). The game adds every other setting at its default, and reads
# these however it starts: an invite link runs the copy without this script.
if [[ ! -e $userdir/config.toml ]]; then
    printf '[paths]\nsaves = "%s"\n\n[update]\nauto = false\n' "$userdir/saves" > "$userdir/config.toml"
fi

# pacman updates the game, not the game's own updater.
export HALO_UPDATE_AUTO=false

exec "$userdir/halo" "$@"
