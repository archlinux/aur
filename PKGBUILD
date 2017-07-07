# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-vobject
pkgver=0.9.5
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='https://eventable.github.io/vobject/'
license=('Apache')
arch=('any')
depends=('python2-dateutil' 'python2-pyicu')
makedepends=('python2-distribute')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('344bd0e2b95c507a1b99fee44f4f2bf3e12991f14b6f181bf98eed42162db764')

package() {
  cd "vobject-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
