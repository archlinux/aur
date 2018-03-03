# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Contributor: Milo Mirate <mmirate@gmx.com>
_pkgname=plumbum
pkgname=python2-plumbum
pkgver=1.6.6
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
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d179b90a9927f91427a28c1bac2864c61342cb43ef39aa7324c7c9a96bcc23eb')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
