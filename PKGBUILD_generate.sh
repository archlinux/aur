#!/bin/zsh
pkgbuild_file='PKGBUILD'
curl -O https://raw.githubusercontent.com/archlinux/svntogit-packages/master/okular/trunk/PKGBUILD

sed -i '1 i # Maintainer: Ben Song <bensongsyz@gmail.com>' $pkgbuild_file
sed -i 's/pkgname=okular/pkgname=okular-vim-colemak\n_pkgname=okular/g' $pkgbuild_file
sed -i 's/\([^_]\)pkgname\([^=]\)/\1_pkgname\2/g' $pkgbuild_file
sed -i 's/pkgdesc.*/pkgdesc="Document Viewer with colemak vim-binding"/' $pkgbuild_file
sed -i 's/\(source=.*\){,.sig})/conflicts=('"'okular'"')\n\1)/' $pkgbuild_file
sed -i 's/\(sha256sums=.*\)/\1)/' $pkgbuild_file
sed -i "s/ *'SKIP')//" $pkgbuild_file
sed -i ':a;N;$!ba;s/validpgpkeys=.*[\n\r]options/options/g' $pkgbuild_file


prepare='prepare() {\n    cp $_pkgname-$pkgver\/part\/pageview.cpp ..\/\n    sed "s\/Key_J\\([^a-zA-Z]\\)\/Key_N\\1\/g;\n	s\/Key_K\\([^a-zA-Z]\\)\/Key_E\\1\/g;\n	s\/Key_L\\([^a-zA-Z]\\)\/Key_I\\1\/g" -i okular-$pkgver\/part\/pageview.cpp || return 1\n}'

sed -i "s/\(options.*\)/\1\n\n$prepare/" $pkgbuild_file
