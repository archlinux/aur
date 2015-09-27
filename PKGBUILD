# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-fabdeploit
pkgver=0.12.6
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

sha256sums=('b795e5562c526c46eb04805c2e93145d63bbeb08494577c6fef56943f74b267f')
