# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=pdd
pkgver=1.3
pkgrel=1
pkgdesc="Tiny date, time diff calculator."
arch=('any')
url="https://github.com/jarun/pdd"
license=('GPL')
depends=('python-dateutil')
source=("https://github.com/jarun/pdd/archive/v${pkgver}.tar.gz")
sha256sums=('d1cb1cf2c10a6daf4e7b64318329964f47e38ad3fba0f94325b9eed62ff76402')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
