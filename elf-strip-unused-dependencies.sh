#!/bin/bash

binary=$1

exec 3< <(ldd -u "$binary" | grep -oP '[^/:]+$')

patchargs=""
dropped=""
while read -r dep; do
    dropped="$dep $dropped"
    patchargs="--remove-needed $dep $patchargs"
done <&3
exec 3<&-

if [[ $dropped == "" ]]; then
    exit 0
fi

echo -e "patchelf '$binary' - removing unused dependencies:\n $dropped"
patchelf $patchargs $binary
