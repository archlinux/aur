#!/bin/bash
#
# Created by Darjan Krijan [https://disc-kuraudo.eu]
#
# Source this script to setup the environment for ps3toolchain
#

export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PS3DEV}/bin:${PATH}"
export PATH="${PS3DEV}/ppu/bin:${PATH}"
export PATH="${PS3DEV}/spu/bin:${PATH}"
