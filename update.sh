#!/bin/bash
set -e

# requires `pacman-contrib`
updpkgsums

makepkg --printsrcinfo > .SRCINFO

# uncomment to run a clean build (to eg test)
# makepkg -cf
