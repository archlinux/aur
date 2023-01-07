# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname=sysexits
pkgver=7.2
pkgrel=1
pkgdesc="OpenBSD’s sysexits.h"
arch=('any')
url="https://man.openbsd.org/sysexits"
license=('BSD')
provides=('sysexits')
source=("https://mirror.planetunix.net/pub/OpenBSD/7.2/src.tar.gz")
sha256sums=('6180476b1e47cbe25f9e3247e4403e7c0b5d9887025082d0ce09baa0a9e70b6b')

package() {
	cd "$srcdir/include/"
	mkdir -p "$pkgdir/usr/include/"
	cp "$pkgname.h" "$pkgdir/usr/include/"
}
