# Maintainer: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.8.2
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
options=(!emptydirs)
source=("https://github.com/python-caldav/caldav/archive/v${pkgver}.tar.gz")
sha256sums=('cb6b913330f9f608102e707284f429c83a1121bda33829d6c935c0c42404372e')

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
