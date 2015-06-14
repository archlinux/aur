#!/bin/sh

# Enable Nvidia threaded optimizations
export __GL_THREADED_OPTIMIZATIONS=1

exec /usr/share/dolphin-emu/dolphin-emu ${@}
