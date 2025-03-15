#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

exec /usr/lib/xc-music/xc-music "$@"
