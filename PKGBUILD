#!/bin/sh

# Kepler GTK theme
# Maintainer: ChromaCat248 <chromacat248@gmail.com>

pkgname=kepler-gtk-theme;
pkgver=1.0;
pkgrel=1;
pkgdesc="Kepler GTK theme";
url="https://github.com/ChromaCat248/Kepler";
arch=('any');
license=('GPLv3');
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/ChromaCat248/Kepler/releases/download/${pkgver}/Kepler.tar.zst");
sha256sums=('ea958b13264fcf1883439d5786e1938ec2a4e3f887479c88b17591b2e96c1e3c')

_themename="Kepler";

package() {
	# create theme dir
	install -dm755 "$pkgdir/usr/share/themes/${_themename}"
	
	# install theme
	find . -type f -exec \
	install -Dm644 '{}' "$pkgdir/usr/share/themes/${_themename}/{}" \;
};





