#!/bin/bash
md5sum bros.desktop
makepkg -f & \
makepkg --printsrcinfo > .SRCINFO
