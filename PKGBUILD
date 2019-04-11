# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=pdd
pkgver=1.4
pkgrel=1
pkgdesc="Tiny date, time diff calculator."
arch=('any')
url="https://github.com/jarun/pdd"
license=('GPL')
depends=('python-dateutil')
source=("https://github.com/jarun/pdd/archive/v${pkgver}.tar.gz")
sha256sums=('e3d2ec2ebfd94572d033f94885a99906343459431f3299cf945c7bd6f1258eab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
