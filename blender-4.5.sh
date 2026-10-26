#!/bin/bash
_BLENDER_DIR="/opt/blender-4.5-lts"
export LD_LIBRARY_PATH="${_BLENDER_DIR}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "${_BLENDER_DIR}/blender" "$@"
