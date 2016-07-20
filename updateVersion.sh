#!/bin/sh

# just verify version and stuff
makepkg --noextract --nobuild
# and update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

