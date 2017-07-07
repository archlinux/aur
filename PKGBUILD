# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname="python-vobject"
pkgver=0.9.5
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='https://eventable.github.io/vobject/'
license=('Apache')
arch=('any')
depends=('python-dateutil' 'python-pyicu')
makedepends=('python-setuptools')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('344bd0e2b95c507a1b99fee44f4f2bf3e12991f14b6f181bf98eed42162db764')

package() {
  cd "vobject-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
  rm -rf ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
