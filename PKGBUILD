# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=pdd
pkgver=1.6
pkgrel=1
pkgdesc="Tiny date, time diff calculator."
arch=('any')
url="https://github.com/jarun/pdd"
license=('GPL')
depends=('python-dateutil')
source=("https://github.com/jarun/pdd/archive/v${pkgver}.tar.gz")
sha256sums=('607fe77b0faf3f50301971120bad01da571c9107151a5344523ee38055649267')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
