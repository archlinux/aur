# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=libtga
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight library to read and write tga images"
url="http://tgalib.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL')
source=("http://downloads.sourceforge.net/project/tgalib/libtga/${pkgver}/libtga-${pkgver}.tar.gz")
sha1sums=('368d8667f1ca28075e92616c0856f1f28dc8103e')

build() {
  cd "${srcdir}/libtga-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libtga-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
