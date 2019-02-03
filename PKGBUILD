# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python2-plumbum
pkgver=1.6.7
pkgrel=1
pkgdesc="Shell combinators library."
arch=('any')
url="https://pypi.python.org/pypi/plumbum"
license=('MIT')
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
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d143f079bfb60b11e9bec09a49695ce2e55ce5ca0246877bdb0818ab7c7fc312')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
