# Maintainer: A Frederick Christensen <aurlinux@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.7.1
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
options=(!emptydirs)
source=("https://github.com/python-caldav/caldav/archive/v${pkgver}.tar.gz")
sha256sums=('3ed2d7bd3ed523bbdaa93b5c4e5379db1b44bd4560557787381cb9d20f144741')

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
