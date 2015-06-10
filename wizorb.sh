#!/usr/bin/env bash

confdir="$HOME/.Tribute Games"

[[ -d "$confdir" ]] || install -d "$confdir"
[[ -h "$HOME/Tribute Games" ]] || ln -s "$confdir" "$HOME/Tribute Games"

cd /opt/wizorb
mono Wizorb.exe
rm "$HOME/Tribute Games"

