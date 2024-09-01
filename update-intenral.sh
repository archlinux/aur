#!/bin/sh

set -e

updpkgsums
makepkg -f
makepkg --printsrcinfo > .SRCINFO
