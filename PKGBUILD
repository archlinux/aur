# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-fabdeploit
pkgver=0.12.2
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

sha256sums=('e0970311599e94b415b96f004903577f28ebbec30d0e4e260d9b8cf05f35f921')
