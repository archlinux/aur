#!/bin/bash

rm -f *.pkg.tar.zst
makepkg --printsrcinfo > .SRCINFO
makepkg -si

sha256sum *.deb
