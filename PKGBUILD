# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0.4
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(33dbcd5df6ac873a38a89b074593988d6141059d331725a2c13f25dbb129c02c)

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
