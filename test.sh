#!/bin/bash
clear
echo -e "makepkg -fp PKGBUILD"
makepkg -Cfp PKGBUILD
echo -e "makepkg -fp git.PKGBUILD"
makepkg -Cfp git.PKGBUILD
echo -e "makepkg -fp systray-git.PKGBUILD"
makepkg -Cfp systray-git.PKGBUILD
echo -e "makepkg -fp deb.PKGBUILD"
makepkg -Cfp deb.PKGBUILD
echo -e "makepkg -fp dev.PKGBUILD"
makepkg -Cfp dev.PKGBUILD
echo -e "makepkg -fp cc.deb.PKGBUILD"
makepkg -Cfp cc.deb.PKGBUILD
