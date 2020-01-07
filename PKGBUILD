# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python-plumbum
pkgver=1.6.8
pkgrel=1
pkgdesc="Shell combinators library."
arch=('any')
url="https://pypi.python.org/pypi/plumbum"
license=('MIT')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
# plumbum is plain python and therefore we don't need to run strip
options=(!emptydirs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/tomerfiliba/plumbum/archive/v${pkgver}.tar.gz")
sha256sums=('9976a789d8eec3c34cc9dc10b2a65a0a89052273e4c3777eeae67e32335fc180')


package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
