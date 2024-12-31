#!/bin/bash

rm -f *.deb

rm -rf src
rm -rf pkg

rm -f *.pkg.tar.zst

makepkg --printsrcinfo > .SRCINFO
