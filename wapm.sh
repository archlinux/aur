#! /usr/bin/env bash
export WASMER_DIR="${WASMER_DIR:-$HOME/.wasmer}"
export WASMER_CACHE_DIR="${WASMER_CACHE_DIR:-$WASMER_DIR/cache}"
exec wapm.bin $@
