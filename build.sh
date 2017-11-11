#!/usr/bin/env bash
set -e
set -x

makepkg
makepkg --printsrcinfo > .SRCINFO
