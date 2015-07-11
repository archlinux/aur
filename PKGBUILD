# Maintainer: David Danier <david.danier@team23.de>
pkgname=python2-jig
pkgver=0.1.9
pkgrel=1
pkgdesc="Check your code for stuff before you 'git commit'"
arch=('any')
url="https://pypi.python.org/pypi/jig"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-distribute')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/j/jig/jig-$pkgver.tar.gz)
md5sums=('8019da231fcacc8c4a6cf2e03cdfe74c')

package() {
  cd "$srcdir/jig-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
