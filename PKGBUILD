# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.2.6
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/y/yapf/yapf-$pkgver.tar.gz")
sha256sums=('05c676175046d64376ba50e232adb6a436a0268a6eefed89e1063488ee2d87ab')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
