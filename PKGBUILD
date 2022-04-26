# Maintainer: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.9.0
pkgrel=2
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
optdepends=('python-pytz: Resolves https://github.com/collective/icalendar/issues/333'
	    'python-tzlocal: Resolves https://github.com/collective/icalendar/issues/333')
options=(!emptydirs)
source=("https://github.com/python-caldav/caldav/archive/v${pkgver}.tar.gz")
sha256sums=('a18f343a1f8f1d71ff18c4f90334510814bd8ebda1b844ec419c5e7ffaae2ea6')

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
