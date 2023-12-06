#!/bin/sh

# This script just sets up LD_LIBRARY_PATH to the location of
# the script so that amdspv can find spvgen.so next to it
PATH=$(readlink -f $(dirname "${0}"))
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${PATH}" "${PATH}"/amdspv "${@}"
