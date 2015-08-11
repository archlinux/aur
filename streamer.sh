#!/bin/bash

mkdir -p $HOME/.config/airtame/logs
cd $HOME/.config/airtame
export LD_LIBRARY_PATH=/opt/airtame/lib
export AIRTAME_LOG_PATH=$HOME/.config/airtame/logs
export AIRTAME_MODULES=/opt/airtame/modules

/opt/airtame/bin/airtame-streamer $@
