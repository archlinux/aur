#!/bin/bash

_BLENDER_DIR="/opt/blender-lts"

LD_LIBRARY_PATH="${_BLENDER_DIR}/lib"

exec "${_BLENDER_DIR}/blender" "$@"
