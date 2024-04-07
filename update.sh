#!/bin/bash

source $(dirname $0)/update_pkgbuild.sh

updpkgsums
makepkg --printsrcinfo > .SRCINFO
