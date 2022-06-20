#!/bin/bash
md5sum altirra *.desktop *.png firmware-setup.reg

desktop-file-validate *.desktop \
&& namcap PKGBUILD \
&& makepkg -f \
&& namcap *.pkg.tar.zst \
&& makepkg --printsrcinfo > .SRCINFO
