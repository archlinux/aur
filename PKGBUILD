# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0.5
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(7f7c42f8bffcd74da5f30ac6b97fadf0198c84e7cc90402349e0027201f136f8)

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
