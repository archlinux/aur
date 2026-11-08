#!/bin/bash
xnviewmp_root=$(dirname "$(realpath "$0")")
export LD_LIBRARY_PATH="${xnviewmp_root}/lib${LD_LIBRARY_PATH+:${LD_LIBRARY_PATH}}"
exec "${xnviewmp_root}/XnView" "$@"
