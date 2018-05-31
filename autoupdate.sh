#!/bin/bash

curl "http://www.dynare.org/release/source/MD5SUMS" | tail -n 1 > md5list.txt
read -a words < md5list.txt

# replace md5hash
sed "s/md5sums=('.*')/md5sums=('${words[0]}')/" PKGBUILD > PKGBUILD

# replace version
dynarever="$(echo "${words[1]}" | sed 's/.tar.xz//')"
dynarever="$(echo $dynarever | sed 's/dynare-//')"
sed "s/pkgver=[0-9].[0-9].[0-9]/pkgver=${dynarever}/g" PKGBUILD > PKGBUILD

# update
makepkg --printsrcinfo > .SRCINFO

#git add PKGBUILD .SRCINFO
#git commit -c="Updated to ${dynarever}"
#git push
