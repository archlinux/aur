# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=pdd
pkgver=1.7
pkgrel=1
pkgdesc="Tiny date, time diff calculator."
arch=('any')
url="https://github.com/jarun/pdd"
license=('GPL')
depends=('python-dateutil')
source=("https://github.com/jarun/pdd/archive/v${pkgver}.tar.gz")
sha256sums=('a81adcac025b08c7c933f028339c55a67d0da6c81845fe3d18fd4187010a63d4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
