# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgbase=python-pype32
_pyname=pype32
pkgname=('python-pype32' 'python2-pype32')
makedepends=('python' 'python2')
_pkgver=0.1-alpha4-1
pkgver=0.1
pkgrel=1
pkgdesc="Yet another Python library to read and write PE/PE+ files."
arch=('any')
url="https://pypi.python.org/pypi/pype32#downloads"
license=('BSD3')
source=("https://pypi.python.org/packages/source/p/$_pyname/$_pyname-$_pkgver.zip")
sha512sums=('a3ebf1f337d698660f5350aaf062ee3ba89156293d5e526e4e0b8ad35e89dac511d2f0c2b6a40fdb98cfed2061f33a642720128c4a0069cf8953a0fcaa8ad358')

package_python-pype32() {
  depends=('python')
  cd "$srcdir/$_pyname-$_pkgver"
  python setup.py install -O1 --root=$pkgdir
}

package_python2-pype32() {
  depends=('python2')
  cd "$srcdir/$_pyname-$_pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

