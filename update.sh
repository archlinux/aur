#!/usr/bin/env bash
# export CHROOT=${CHROOT:-$HOME/.local/share/chroot}

updpkgsums
namcap PKGBUILD --info || exit 1

# wget https://archive.archlinux.org/packages/z/zig/zig-0.15.2-3-x86_64.pkg.tar.zst
pkgctl build -I zig-0.15.2-3-x86_64.pkg.tar.zst

# makechrootpkg -c -r $CHROOT -- -Acsf .
makepkg --printsrcinfo >.SRCINFO
