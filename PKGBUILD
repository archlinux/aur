# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-vobject
pkgver=0.9.1
pkgrel=2
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='https://eventable.github.io/vobject/'
license=('Apache')
arch=('any')
depends=('python2-dateutil' 'python2-pyicu')
makedepends=('python2-distribute')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('d826329145b9f0460cf414b32826394e3c881e81c4b55500fa9bf5157e24247e')

package() {
  cd "vobject-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
