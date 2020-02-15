#!/usr/bin/env bash
#

set -xeuo pipefail

rm -rf .SRCINFO
makepkg --printsrcinfo > .SRCINFO
makepkg
