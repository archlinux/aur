#!/bin/sh

if [ -x "/usr/bin/padsp" ]; then
    padsp /opt/heretic2/heretic2
else
    /opt/heretic2/heretic2
fi
