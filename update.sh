#!/bin/sh
set -e

rm -rf *tar* src pkg *log*
updpkgsums
makepkg --printsrcinfo > .SRCINFO
rm -rf *tar* src pkg *log*
makepkg -C -f --noconfirm
