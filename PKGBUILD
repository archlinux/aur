# Maintainer: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.8.0
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
options=(!emptydirs)
source=("https://github.com/python-caldav/caldav/archive/v${pkgver}.tar.gz")
sha256sums=('b252c3d818b6d69362f2b1bb2c6891e267e790e7e224b53869b3e574480ca402')

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
