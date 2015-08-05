# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-fabdeploit
pkgver=0.12.4
pkgrel=1
pkgdesc="fabric utilities for git based deployments"
arch=('any')
url="https://pypi.python.org/pypi/fabdeploit"
license=('BSD')
groups=()
depends=('python2' 'python2-gitpython' 'fabric')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/f/fabdeploit/fabdeploit-$pkgver.tar.gz)

package() {
  cd "$srcdir/fabdeploit-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('71201370e6045ee5fc851a819db2336d86958afc6bb7f064f14b76d732abe975')
