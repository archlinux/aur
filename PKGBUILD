# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python2-plumbum
pkgver=1.6.3
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
source=("https://pypi.python.org/packages/50/15/f26f60e1bb82aabed7ff86f3fd2976784047f9a291c63ac9019086a69559/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0249e708459f1b05627a7ca8787622c234e4db495a532acbbd1f1f17f28c7320')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
