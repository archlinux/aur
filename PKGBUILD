# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-vobject
pkgver=0.9.4.1
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='https://eventable.github.io/vobject/'
license=('Apache')
arch=('any')
depends=('python2-dateutil' 'python2-pyicu')
makedepends=('python2-distribute')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('accc36d227ce02f3b258e666d504745e21a149a33c307a8d32d9fd439d2f5efb')

package() {
  cd "vobject-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
