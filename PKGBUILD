# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-vobject
pkgver=0.9.0
pkgrel=1
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='http://vobject.skyhouseconsulting.com'
license=('Apache')
arch=('any')
depends=('python2-dateutil' 'python2-pyicu')
makedepends=('python2-distribute')
source=("https://github.com/eventable/vobject/archive/${pkgver}.tar.gz")
sha256sums=('a9c6179351c00943de9ad4bb264e1fe66a91e9052a7c3d24485887c12026e0b6')

package() {
  cd "vobject-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
