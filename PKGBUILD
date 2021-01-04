# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=pdd
pkgver=1.5
pkgrel=1
pkgdesc="Tiny date, time diff calculator."
arch=('any')
url="https://github.com/jarun/pdd"
license=('GPL')
depends=('python-dateutil')
source=("https://github.com/jarun/pdd/archive/v${pkgver}.tar.gz")
sha256sums=('cd615dc9aa015bb5d0f1a1d03f1de7db994628256cfe8ed8ab25e1fb2e9d3762')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
