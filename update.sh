#!/bin/sh

rm -rf *tar* src pkg *log*
updpkgsums
makepkg --printsrcinfo > .SRCINFO
rm -rf *tar* src pkg *log*
