#!/bin/bash
#
# Created by Darjan Krijan [https://disc-kuraudo.eu]
#
# Source this script to setup the environment for ps3libraries
#

[ -z "${PS3DEV}" ] && source /opt/ps3dev/ps3toolchain.sh
export CPATH="${PS3DEV}/portlibs/ppu/include:${CPATH}"
export LIBRARY_PATH="${PS3DEV}/portlibs/ppu/lib:${CPATH}"
export PKG_CONFIG_PATH="${PS3DEV}/portlibs/ppu/lib/pkgconfig:${CPATH}"
