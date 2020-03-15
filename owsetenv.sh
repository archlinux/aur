#!/bin/sh

export WATCOM=/opt/watcom
export PATH=$WATCOM/binl64:$WATCOM/binl:$PATH
export EDPATH=$WATCOM/eddat

#these variables change based on compilation target
#defaults are set for native compilation
export INCLUDE=$WATCOM/lh
# export LIB =





