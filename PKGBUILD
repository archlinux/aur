# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-pypdns
_pyname=pypdns
pkgname=('python-pypdns' 'python2-pypdns')
makedepends=('python' 'python2')
pkgver=1.3
pkgrel=1
pkgdesc="Python API for PDNS."
arch=('any')
url="https://pypi.python.org/pypi/pypdns#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('193454f76a533764194ff9460f1d656240d8a8ef0a4d88a7ea71aa3546988162945bea3e7b8c8ebcbb903332867284359b699c62f06fe76ba1b9f293c53153d8')

package_python-pypdns() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
}

package_python2-pypdns() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

