#!/usr/bin/bash

set -euxo pipefail

# Unfortunately, the current build of gettext 0.26 breaks the build
# Due to this, we build gettext 0.25 (last known working version)
# and downgrade.

add_keys() {
    KEYS=$(makepkg --printsrcinfo | grep -E '\s+validpgpkeys' | sed 's/\s\+validpgpkeys = //g' || true)
    if [ ! "z$KEYS" = "z" ]; then
        for key in $KEYS; do
            sudo GNUPGHOME=/etc/pacman.d/gnupg gpg --recv-key "$key"
        done
    fi
}

install_deps() {
    if [ -f PKGBUILD ]; then
        INSTALL_PKG=""
        for pkg in $(makepkg --printsrcinfo | grep -E '\s+depends|\s+makedepends' | sed 's/\s\+\(make\)\?depends = //g' || true); do
            INSTALL_PKG="$INSTALL_PKG $pkg"
        done
        sudo pacman -Sy
        sudo pacman -S --noconfirm $INSTALL_PKG
    fi
}

if [ -d gettext ]; then
    rm -rf gettext
fi

git clone -b 0.25.1-1 https://gitlab.archlinux.org/archlinux/packaging/packages/gettext.git
pushd gettext
makepkg
sudo pacman -U --noconfirm gettext-0.25.1-1*.pkg.tar.zst
rm *.pkg.tar.*
popd
