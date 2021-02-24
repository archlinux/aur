#!/usr/bin/env bash

#set -o xtrace
set -o errexit -o nounset -o pipefail -o errtrace
IFS=$'\n\t'

if [[ $0 == *rgb ]] ; then
    color=rgb
elif [[ $0 == *mono ]] ; then
    color=mono
else
    exit 1
fi

src=${1:-}
src=$(readlink -f "$src")
dst=${2:-}
if [ -n "$dst" ] ; then
    dst=$(readlink -f "$dst")
fi
stride=${3:-}

cd /usr/lib/__PKGNAME__/

./${color}_starnet++ "$src" "$dst" $stride
