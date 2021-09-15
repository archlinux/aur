#!/bin/sh

updpkgsums
makepkg -sif
makepkg --printsrcinfo > .SRCINFO
