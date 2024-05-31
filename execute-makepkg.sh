#!/bin/bash

mkdir /home/bb/build
ln -s /home/bb/aur/PKGBUILD /home/bb/build/PKGBUILD
cd /home/bb/build
makepkg -si --noconfirm
