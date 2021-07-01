# Maintainer: jose1711 <jose1711 at gmail dot com>

pkgname=csvprintf
pkgver=1.0.3
pkgrel=2
pkgdesc="a simple csv file parser for command line"
arch=('i686' 'x86_64')
url="https://code.google.com/p/csvprintf/"
license=('Apache')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/csvprintf/${pkgname}-${pkgver}.tar.gz")
md5sums=('30a1a7bf0d15ce1e73a63d19e40d0596')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
