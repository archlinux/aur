#!/bin/bash
makepkg -f

echo ""
echo "Testing PKGBUILD ################################"
echo ""
namcap -i PKGBUILD
echo ""
echo "Testing package  ################################"
echo ""
namcap -i *.pkg.tar.zst
echo ""

