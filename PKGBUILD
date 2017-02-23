# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Marek Skrobacki <skrobul@skrobul.com>

pkgname=input-utils
pkgver=1.3
pkgrel=1
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("http://www.kraxel.org/releases/input/input-$pkgver.tar.gz")
sha256sums=('9142c34d508f2da4cd53d6348fee77e30b69c35c8dabfadfc5a6db09c4bd8087')

build() {
  cd "$srcdir/input-$pkgver"
  make
}

package() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
