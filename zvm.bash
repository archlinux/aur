#!/bin/bash
XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
ZVM_SET_CU=0 # Disable self-update check
ZVM_PATH="$XDG_DATA_HOME/zvm" # XDG-compliant storage location
ZVM_INSTALL=/usr/lib/zvm/self # Parent directory of the zvm binary

exec "$ZVM_INSTALL/zvm" "$@"