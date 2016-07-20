#!/bin/sh

# just verify version and stuff
makepkg --nobuild
# and update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

