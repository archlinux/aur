#!/bin/sh
## Streets of Rage Remake 5
## Linux wrapper for multi-user support.

## Where to store the session. This is an environment variable.
SORR_SESSION="${SORR_SESSION:-$HOME/.sorr}"

SORR_FOLDER="$(dirname "$(realpath "$0")")"

prepare_folder() {
	[ ! -d "$SORR_SESSION/$1" ] && mkdir -p "$SORR_SESSION/$1"
}
prepare_symlink() {
	## If symlink does not exist or is dangling.
	if [ ! -h "$SORR_SESSION/$1" ] || [ ! -e "$SORR_SESSION/$1" ]; then
		ln -sf "$SORR_FOLDER/$1" "$SORR_SESSION/$1"
	fi
}

prepare_folder
[ ! -w "$SORR_SESSION" ] && echo "SORR_SESSION=$SORR_SESSION is not writable." >&2 && exit

prepare_symlink bgdc
prepare_symlink bgdi
prepare_symlink data
prepare_symlink palettes
prepare_symlink SorMaker.dat
prepare_symlink SorR.dat

prepare_folder mod
prepare_folder mod/games

prepare_symlink mod/music
prepare_symlink mod/namesong.txt
prepare_symlink mod/system.txt

cd "$SORR_SESSION"
LD_LIBRARY_PATH=./data ./bgdi ./SorR.dat
