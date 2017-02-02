#!/bin/bash

set -e

PKGVER=$1
REL=$2
VER=$PKGVER-$REL

EOL="$"

./fetch.sh

tar cvf $VER.tar.gz \
    larryshell/larryshell \
    larryshell/larryshellrc \
    larryshell/larryshell-errors.txt \
    larryshell/larryascii

cp $VER.tar.gz /srv/http/larryshell

perl -pi -e "s/(pkgver=).*$EOL/\1'$PKGVER'/" PKGBUILD
perl -pi -e "s/(pkgrel=).*$EOL/\1'$REL'/" PKGBUILD
perl -pi -e "s/(md5sums=)\((.*)\)/\1('`md5sum $VER.tar.gz | cut -d " " -f1`')/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

# rm -rf -- src pkg *.tar* larryshell
