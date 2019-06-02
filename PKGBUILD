# Maintainer: A Frederick Christensen <aurlinux@nosocomia.com>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-caldav
pkgver=0.6.1
pkgrel=1
pkgdesc="a caldav client library"
arch=('any')
url="https://pypi.python.org/pypi/caldav"
license=('GPL')
depends=('python' 'python-lxml' 'python-vobject' 'python-dateutil' 'python-distribute' 'python-six' 'python-requests')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/c/caldav/caldav-0.6.1.tar.gz")
sha256sums=(eddb7f4e6a3eb5f02eaa2227817a53ac4372d4c4d51876536f4c6f00282f569e)

package() {
  cd "$srcdir/caldav-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
