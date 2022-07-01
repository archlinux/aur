#!/bin/bash
clear
echo -e "makepkg -fp PKGBUILD"
makepkg -fp PKGBUILD
echo -e "makepkg -fp cc.deb.PKGBUILD"
makepkg -fp cc.deb.PKGBUILD
