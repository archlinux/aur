# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-pypdns
_pyname=pypdns
pkgname=('python-pypdns' 'python2-pypdns')
makedepends=('python' 'python2')
pkgver=1.2
pkgrel=1
pkgdesc="Python API for PDNS."
arch=('any')
url="https://pypi.python.org/pypi/pypdns#downloads"
license=('BSD')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('678bcb670429083d124d893bdeb801db08f458e77c165bbc19e174dc42e37b28399b1d4d0c8d4593ca44cd7f93cdf988caf5f58fa339ee46ed4b35e91608aa73')

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

