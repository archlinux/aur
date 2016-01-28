# Maintainer: Christian Rebischke <Chris.Rebischke@archlinux.org>

pkgbase=python-terminaltables
_pyname=terminaltables
pkgname=('python-terminaltables' 'python2-terminaltables')
makedepends=('python' 'python2')
pkgver=2.1.0
pkgrel=1
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://pypi.python.org/pypi/terminaltables#downloads"
license=('MIT')
source=("https://pypi.python.org/packages/source/t/$_pyname/$_pyname-$pkgver.tar.gz")
sha512sums=('6a2719dac42195b95fdf22d8fea3857924cf88ae6f0ece00c6f97ff9acf36444a3c9a73410b2b919c9cf11e785279ab1f7ea26c51276b055918ec78297b86bfa')

package_python-terminaltables() {
    depends=('python')
    cd "$srcdir/$_pyname-$pkgver"
    python setup.py install -O1 --root=$pkgdir
}

package_python2-terminaltables() {
    depends=('python2')
    cd "$srcdir/$_pyname-$pkgver"
    python2 setup.py install -O1 --root=$pkgdir
}

# vim:set et sw=4 ts=4 tw=76:
