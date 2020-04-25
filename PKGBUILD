# Maintainer: Andy Kluger <https://t.me/andykluger>
# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python-plumbum
pkgver=1.6.9
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
sha256sums=('0f3b5db1ab309d5cff5ba04a2335d522c6e5eb019b910938685b08800af006c9')


package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
