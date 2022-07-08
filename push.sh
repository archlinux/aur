#!/usr/bin/env bash
makepkg --printsrcinfo > .SRCINFO
git add -A
git commit -m "Mods"
git push origin master
