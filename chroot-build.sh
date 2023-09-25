#!/bin/bash

## builds done in a clean chroot
## source files taken from pkgdir/src-cache if present
## output packages placed in pkgdir/release-pkg if present

# NOTE: you can send environment variables to chroot/makepkg by stuffing them on the end of the makechrootpkg command after --

#CHROOT="$HOME/work/arch-kernels/build-chroot"
HOME="$HOME"

fatal() { echo "$@" >&2; exit 1; }
# look for a PKGBUILD
if ! [[ -s PKGBUILD ]]; then
  fatal "no PKGBUILD in this directory!"
fi
# look for valid chroot
if ! [[ -d "${CHROOT}/root" ]]; then
  fatal "${CHROOT}/root doesn't exist, womp womp"
fi

# if SRCDEST is empty then look for pkg src-cache/ directory and use it
if [[ -z ${SRCDEST+x} ]] && [[ -d "$(pwd)/src-cache" ]]; then
  export SRCDEST="$(pwd)/src-cache"
fi

# use supplied output directory or fall back to ./release-pkg/ if present
if [[ -d "$DEST" ]]; then
  export PKGDEST="$DEST"
  export LOGDEST="$DEST"
elif [[ -d "$(pwd)/release-pkg" ]]; then
  export PKGDEST="$(pwd)/release-pkg"
  export LOGDEST="$(pwd)/release-pkg"
fi

# use modprobed-db
cp PKGBUILD .PKGBUILD
cp $HOME/.config/modprobed.db "$(dirname "$(readlink -f -- "$0")")"
sed 's|#  modprobed-db|  modprobed-db|g' -i PKGBUILD
sed 's|#  modprobed.db|  modprobed.db|g' -i PKGBUILD
sed 's|# make LSMOD|make LSMOD|g' -i PKGBUILD
sed 's|_microarchitecture=93|_microarchitecture=15|g' -i PKGBUILD
sed "s||Microarchitecture='CONFIG_GENERIC_CPU3'|Microarchitecture='CONFIG_MZEN3'|g" -i PKGBUILD 
updpkgsums

#
# To send environment variable to a PKGBUILD call this script like this:
#   `rbuild.sh -- {any makepkg flags} VAR=VALUE VAR2=VALUE etc..`
#

# either use makechrootpkg ...
# makechrootpkg -c -r "${CHROOT}" "$@"

# or clean-chroot-manager (AUR)
sudo ccm s

rm PKGBUILD
mv .PKGBUILD PKGBUILD
