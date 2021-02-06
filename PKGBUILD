# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname='python-py_find_1st'
pkgver=1.1.5
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/roebel/py_find_1st"
makedepends=('python-setuptools')
depends=('python-numpy')
license=('GPL')
arch=('any')
source=("https://pypi.python.org/packages/source/p/py_find_1st/py_find_1st-$pkgver.tar.gz")
sha256sums=('f99207bc83df361c4cd9c6c2aaf504907ffce7fdd33ae3d3cbf39c68a4f1c1a9')

build() {
    cd "$srcdir"/py_find_1st-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/py_find_1st-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}
