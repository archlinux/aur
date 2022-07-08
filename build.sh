#!/bin/bash
desktop-file-validate *.desktop \
&& namcap PKGBUILD \
&& makepkg --printsrcinfo > .SRCINFO \
&& makepkg -fs \
&& namcap *.pkg.tar.zst
