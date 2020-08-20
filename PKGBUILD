pkgname=python-treebeard
pkgver=0.1.1
pkgrel=1
pkgdesc='Generate directory tree representation in different formats'
arch=('any')
url="http://pypi.python.org/pypi/treebeard/"
license=('BSD')
source=("https://pypi.python.org/packages/26/86/89c4a90385d3b0846f953f50e30b77878fa7fc629a9a5c706ffc42684dbf/treebeard-0.1.1.tar.gz")
md5sums=('e45a45cbd3f6d4bb872ef4675e93ece2')

package() {
    cd "$srcdir/treebeard-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
