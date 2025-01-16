#!/usr/bin/env bash

set -eux

if [ "$#" -lt 1 ]; then
    exit 1
fi

pwd

# Fix Make SIGSEGV https://savannah.gnu.org/bugs/index.php?65172
sed -i 's/MODERN_KERNEL_SOURCES_NOT_FOUND_ERROR/KERNEL_SRC_ABSENT_ERR/g' "$1/src/Makefile"
