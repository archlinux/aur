# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
pkgver=0.9.0
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='https://pypi.python.org/pypi/vobject'
license=('Apache')
arch=('any')
depends=('python-dateutil' 'python-pyicu')
makedepends=('python-setuptools')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('a9c6179351c00943de9ad4bb264e1fe66a91e9052a7c3d24485887c12026e0b6')

package() {
  cd "vobject-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
  rm -rf ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
