# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0.1
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=(ffutils-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(024c3b8cb7d83273bb4ea704fc8f56b4c90b0c0faa0450e09d1811d2771e595c)

package() {
  cd "${srcdir}/ffutils"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
