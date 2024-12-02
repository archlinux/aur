# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=(ffutils-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(4d68f92632835edb3b5c63ac9bb0948a48594ae58ca2499ac5a921f87bf1995d)

package() {
  cd "${srcdir}/ffutils"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
