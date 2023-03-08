#!/bin/bash
set -e

pkgver=$(curl -I "https://www.dropbox.com/download?plat=lnx.x86_64" | grep -iP '^Location:' | grep -Po '\d+\.4\.\d+(?=\.tar\.gz)')
echo $pkgver
