# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.6.1
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/y/yapf/yapf-$pkgver.tar.gz")
sha256sums=('b972d0f9185ad42b604d2d03f72184506c2d463727e6f73bea4abcdbcd1140c2')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
