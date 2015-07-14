# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
_pkgname=python-potr
pkgname=python2-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc="pure Python Off-The-Record encryption"
arch=('any')
url="https://pypi.python.org/pypi/python-potr"
license=('LGPL3')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('72b0001dd8dc4acd8ea2cc2ce9d0a1f6')

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
