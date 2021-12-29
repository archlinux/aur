#!/bin/bash

msg() {
ALL_OFF="\\e[1;0m"
BOLD="\\e[1;1m"
GREEN="${BOLD}\\e[1;32m"
local mesg=$1; shift
printf "${GREEN}==>${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}" "$@" >&2
}

echo
msg "Warning:
 -> obs-studio-tytan652 does not support Manjaro
 -> officially.
 -> Some dependency version checks are disabled to
 -> allow the package to be built on it.
 -> So the package may require to be rebuilt if some
 -> dependency packages are updated. If not the
 -> package could not work correctly.
"
