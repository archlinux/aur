#!/bin/bash
export CHROOT=${CHROOT:-$HOME/.local/share/chroot}

updpkgsums
namcap PKGBUILD --info --exclude carch || exit 1

if [[ ! -d "$CHROOT" ]]; then
  mkdir -p "$CHROOT"
# sudo pacman -Syy
# mkarchroot $HOME/.local/share/chroot/root base-devel
# arch-nspawn $HOME/.local/share/chroot/root pacman -Syyu
fi

pkgctl build \
  --arch x86_64 \
  --inspect always \
  --update-checksums

# makechrootpkg -c -r $CHROOT -- -Acsf .
makepkg --printsrcinfo >.SRCINFO
