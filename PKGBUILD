# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-pymisp
_pyname=pymisp
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2')
pkgver=1.12
pkgrel=1
pkgdesc="API for MISP."
arch=('any')
url="https://pypi.python.org/pypi/pymisp"
license=('BSD2')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('6f991b00b9cf92dde2545b04ddea39c7a90161b0b29fcf8655f8a98e616532f0d4fd5dcee9dd0f401591e6b09499261a2cd52c4273d2f533e3b31387de7c82d3')

package_python-pymisp() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir

}

package_python2-pymisp() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir

}

# vim:set ts=2 sw=2 et:

