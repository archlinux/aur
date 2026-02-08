#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Script copied from https://aur.archlinux.org/packages/vesktop-electron
exec electron /usr/lib/bsky-electron/app.asar "$@"
