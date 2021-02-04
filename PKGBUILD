# Contributor: Milo Mirate <mmirate at gmx dot com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
pkgname=python2-pgpdump
_pkgname=pgpdump
pkgver=1.5
pkgrel=2
pkgdesc="PGP packet parser library."
arch=('any')
url="https://pypi.python.org/pypi/pgpdump"
license=('MIT')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('040a451c8e63de3e61fc5b66efa7fca5')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

}