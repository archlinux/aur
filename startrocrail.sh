#!/bin/bash

configpath="$HOME/.config/rocrail"
mkdir -p $configpath
cd $configpath
/opt/rocrail/bin/rocrail -l /opt/rocrail/bin $@
