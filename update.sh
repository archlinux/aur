#!/bin/bash

dir=$(dirname $0)
source ${dir}/update_pkgbuild.sh

# updpkgsums
source  ${dir}/updpkgsums.sh
makepkg --printsrcinfo > .SRCINFO
