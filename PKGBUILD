# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
pkgver=0.8.1c
pkgrel=2
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='http://vobject.skyhouseconsulting.com'
license=('Apache')
arch=('any')
depends=('python-dateutil' 'python-pyicu')
makedepends=('python-setuptools')
source=("https://github.com/abbgrade/python-vobject/archive/master.zip")
sha256sums=('35ede8ac08816eccac297aa8d1b766c39a1ff6f4871d3a7fe0a0d0077531debb')

package() {
  cd "${pkgname}-master"
  python3 setup.py install --root="${pkgdir}" --optimize=1
  rm -rf ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
