#!/bin/bash
export WINEPREFIX=$HOME/.ltspice/env
wine /usr/share/doc/ltspice/LTspiceHelp.chm "$@"
