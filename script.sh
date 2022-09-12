#!/bin/sh

export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-$HOME/.config/lvim}"
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-$HOME/.local/share/lunarvim}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-$HOME/.cache/lvim}"

exec neovide -- -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" "$@"