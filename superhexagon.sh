#!/bin/sh

# Provide a chance to configure GLUT. For an example, see
# /opt/superhexagon/superhexagonrc.example
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
test -f "$CONFIG" && . "$CONFIG"

cd /opt/superhexagon
exec ./superhexagon
