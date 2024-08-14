#!/bin/bash

if [[ -x /opt/marsdev/m68k-elf/bin/m68k-elf-gcc && -z "$CLANGD_FLAGS" ]]; then
    # See: https://clangd.llvm.org/guides/system-headers#query-driver
    export CLANGD_FLAGS='--query-driver="/opt/marsdev/*-elf/bin/*"'
fi
