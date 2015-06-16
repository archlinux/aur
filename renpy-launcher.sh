#!/usr/bin/env sh
mkdir -p ~/renpy_projects
cd ~/renpy_projects
exec env python2 -OO /usr/share/renpy/renpy.py "$@"
