#!/bin/sh

# Friday Night Funkin' Launcher

cd "$HOME"

# Create and mount writable overlay
mkdir -p ".funkin-overlay"
cd ".funkin-overlay"
rm -rf ".tmp"
mkdir ".tmp"
mkdir ".tmp/workdir"
mkdir ".tmp/merged"
mkdir -p "data"
fuse-overlayfs -o lowerdir="/usr/share/funkin",upperdir="data",workdir=".tmp/workdir" ".tmp/merged"

# Play Friday Night Funkin'
cd ".tmp/merged"
SDL_VIDEODRIVER="x11" ./Funkin # https://github.com/FunkinCrew/Funkin/issues/2498
cd "../.."

# Unmount overlay and delete temporary files
fusermount3 -u ".tmp/merged"
rm -r ".tmp"
