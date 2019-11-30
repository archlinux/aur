# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-flufl-bounce')
_pkgbase='flufl.bounce'
pkgver=3.0
pkgrel=1
pkgdesc="Email bounce detectors"
arch=(any)
url="https://launchpad.net/flufl.bounce"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a2c549fc40a58ddfa9dfd115fe43d5cac4f042e45bacef3be7fb993e1496b34c')
makedepends=('python2-setuptools')

package_python2-flufl-bounce() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
