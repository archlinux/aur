#!/bin/bash
md5sum bros.desktop bros.png
makepkg -f & \
makepkg --printsrcinfo > .SRCINFO
