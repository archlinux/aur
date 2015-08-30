# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-fabdeploit
pkgver=0.12.5
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

sha256sums=('02be2d07cd5a2c2227d7d142648237419fd41ae693ef5836f263ed5545bd88ec')
