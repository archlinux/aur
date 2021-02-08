# Maintainer: Andy Kluger <https://t.me/andykluger>
# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python-plumbum
pkgver=1.7.0
noise=ed/ba/431d7f420cd93c4b8ccb15ed8f1c6c76c81965634fd70345af0b19c2b7bc
pkgrel=1
pkgdesc="Shell combinators library."
arch=('any')
url="https://pypi.python.org/pypi/plumbum"
license=('MIT')
groups=()
depends=('python')
makedepends=('python-pip')
provides=()
conflicts=()
replaces=()
backup=()
# plumbum is plain python and therefore we don't need to run strip
options=(!emptydirs !strip)
# source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/tomerfiliba/plumbum/archive/v${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/${noise}/plumbum-${pkgver}.tar.gz")
sha256sums=('317744342c755319907c773cc87c3a30adaa3a41b0d34c0ce02d9d1904922dce')


package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python -m pip install --root "$pkgdir/" .
}

# vim:set ts=2 sw=2 et:
