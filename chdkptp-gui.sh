#!/bin/sh
# copy this file to chdkptp.sh and ajust for your configuration
# to use the GUI build from a binary package that includes both CLI and GUI change to chdkptp_gui
CHDKPTP_EXE=chdkptp_gui
# path where chdkptp is installed
CHDKPTP_DIR=/usr/lib/chdkptp
# LD_LIBRARY_PATH for shared libraries
# only need if you have compiled IUP support and have NOT installed the libraries to system directories 
#export LD_LIBRARY_PATH=/path/to/iup:/path/to/cd
export LUA_PATH="$CHDKPTP_DIR/lua/?.lua"
"$CHDKPTP_DIR/$CHDKPTP_EXE" "$@"
