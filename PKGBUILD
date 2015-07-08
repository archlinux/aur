# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

pkgname=python2-transaction
pkgver=1.4.3
pkgrel=1
pkgdesc='Transaction management for Python [Python 2]'
arch=('any')
url='http://pypi.python.org/pypi/transaction'
license=('ZPL')
depends=('python2' 'python2-zope-interface')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/t/transaction/transaction-$pkgver.tar.gz)
md5sums=('b4ca5983c9e3a0808ff5ff7648092c76')

build() {
  cd "$srcdir/transaction-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/transaction-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:ts=2:sw=2:et:
