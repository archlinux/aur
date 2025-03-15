# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0.2
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(06f4e36d497dcccbb193345314cf52c4133342ecd3099177f0eb9625366267a5)

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
