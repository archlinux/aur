# Maintainer: Milo Mirate <mmirate at gmx dot com>
pkgname=python2-pgpdump
_pkgname=pgpdump
pkgver=1.5
pkgrel=1
pkgdesc="PGP packet parser library."
arch=('any')
url="https://pypi.python.org/pypi/pgpdump"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('040a451c8e63de3e61fc5b66efa7fca5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:

