#!/bin/bash

set -e

PKGVER=$1
REL=$2
VER=$PKGVER-$REL

EOL="$"

./fetch.sh $PKGVER $REL

shopt -s extglob

tar cvf $VER.tar.gz \
    larryshell/larryshell \
    larryshell/larryshellrc \
    larryshell/larryshell-errors.txt \
    larryshell/larryascii \
    larryshell/larry.cow

cp $VER.tar.gz /srv/http/larryshell

perl -pi -e "s/(pkgver=).*$EOL/\1'$PKGVER'/" PKGBUILD
perl -pi -e "s/(pkgrel=).*$EOL/\1'$REL'/" PKGBUILD
perl -pi -e "s/(md5sums=)\((.*)\)/\1('`md5sum $VER.tar.gz | cut -d " " -f1`')/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

# rm -rf -- src pkg *.tar* larryshell
