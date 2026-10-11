#!/usr/bin/bash
# Game engine not set that paths by default for some reason
#TODO: That would be awesome if someone do that patch, but inside game's code
/usr/bin/VoxelCore --dir "${HOME:?}/.local/share/voxelcore/" --res "/usr/share/VoxelCore/res" "$@"
