#!/bin/bash
export WINEPREFIX=$HOME/.ltspice/env
wine hh /usr/share/doc/ltspice/ltspice.chm "$@"
