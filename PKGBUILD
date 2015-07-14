# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Milo Mirate <mmirate at gmx dot com>
pkgname=python-pgpdump
_pkgname=pgpdump
pkgver=1.4
pkgrel=1
pkgdesc="Python replacement for java.util.Properties."
arch=('any')
url="https://pypi.python.org/pypi/pgpdump"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('b437c28ff9d6a6257a0062c0bbe2a9ec')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:

