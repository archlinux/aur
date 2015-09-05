# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

pkgname=(python-transaction python2-transaction)
pkgver=1.4.4
pkgrel=1
pkgdesc='Transaction management for Python'
arch=('any')
url='http://pypi.python.org/pypi/transaction'
license=('ZPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=(http://pypi.python.org/packages/source/t/transaction/transaction-$pkgver.tar.gz)
md5sums=('a6d6d6fa18e44d1644518bb7d61eac92')

package_python-transaction() {
  depends=('python' 'python-zope-interface')
  cd "$srcdir/transaction-$pkgver"
  python setup.py install --root="$pkgdir"
}

package_python2-transaction() {
  depends=('python2' 'python2-zope-interface')
  cd "$srcdir/transaction-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:ts=2:sw=2:et:
