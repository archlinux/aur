#!/bin/bash

set -ev

rundir=$HOME/pkg

mkdir -p $rundir

cp -R /pkg/* $rundir/

# sync dbs
pacman --sync --refresh

# install reasonbly fresh keyring so we can trust current maintainers
pacman --noconfirm --sync archlinux-keyring

cd $rundir
makepkg -f --asroot --syncdeps --noconfirm
