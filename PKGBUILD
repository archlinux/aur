pkgname=python2-pytrie
pkgver=0.3.1
pkgrel=1
pkgdesc="A pure Python2 implementation of the trie data structure."
url="https://github.com/gsakkis/pytrie"
depends=('python2')
makedepends=('python2')
license=('BSD')
arch=('any')
source=(https://pypi.python.org/packages/source/P/PyTrie/PyTrie-$pkgver.tar.gz)
md5sums=('f7c7184124013abcc18a3e3b638d32ae')

build() {
    cd $srcdir/PyTrie-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/PyTrie-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
