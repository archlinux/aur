# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python2-plumbum
pkgver=1.6.2
pkgrel=1
pkgdesc="Shell combinators library."
arch=('any')
url="https://pypi.python.org/pypi/plumbum"
license=('GPL')
groups=()
depends=('python2' 'python2-six')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
# plumbum is plain python and therefore we don't need to run strip
options=(!emptydirs !strip)
install=
source=("https://pypi.python.org/packages/66/a2/eb943bf1efa2b403debe5b276b024222bd9cecb737f41dd06db6606a43f1/${_pkgname}-${pkgver}.tar.gz")
md5sums=('fb124f7b70d00686831d8d0f74829e65')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
