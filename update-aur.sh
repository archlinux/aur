#!/bin/bash

# From pacman-contrib
updpkgsums

makepkg --printsrcinfo > .SRCINFO || exit 1
