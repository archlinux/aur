# Maintainer: Marek Skrobacki <skrobul@skrobul.com>
pkgname=input-utils
pkgver=1.0
pkgrel=1
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("http://www.kraxel.org/releases/input/input-1.0.tar.gz")
sha256sums=('ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a349b3bff4e3b13')

build() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
