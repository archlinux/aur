#!/bin/bash
#
# simple launcher by carstene1ns 2013
#

# get game from script name
game=${0##*/}

# change to game dir
cd /opt/$game

# launch
./$game "$@"

# change back to original dir
cd - &>/dev/null

# eof
