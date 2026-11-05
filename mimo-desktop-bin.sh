#!/bin/bash
# Launch the official binary with the environment guard that keeps upstream's
# oversized MIMOCODE_CONFIG_CONTENT out of child-process environments (see
# envguard.c). Only the browser process keeps the variable.
_guard='/usr/lib/mimo-desktop-bin/envguard.so'

export LD_PRELOAD="${_guard}${LD_PRELOAD:+:${LD_PRELOAD}}"
exec "/opt/Xiaomi MiMo/xiaomi-mimo-desktop" "$@"
