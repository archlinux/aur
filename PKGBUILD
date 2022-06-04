# Maintainer: A Frederick Christensen <aur@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.9.1
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
optdepends=('python-pytz: Resolves https://github.com/collective/icalendar/issues/333'
	    'python-tzlocal: Resolves https://github.com/collective/icalendar/issues/333')
options=(!emptydirs)
source=("https://github.com/python-caldav/caldav/archive/v${pkgver}.tar.gz")
sha256sums=('1ba065850b92f5f9916ecd022af042ab39e727e9f2507645efaa341e71e2e780')

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
