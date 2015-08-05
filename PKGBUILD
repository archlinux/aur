# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=libreoffice-style-elementary
pkgver=0.1
pkgrel=2
pkgdesc='elementary icons for LibreOffice'
arch=('i686' 'x86_64')
url="https://github.com/shimmerproject/${pkgname}"
license=('GPL')
conflicts=("${pkgname}-git")
makedepends=('zip')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
