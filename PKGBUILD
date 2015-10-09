# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.4.0
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/y/yapf/yapf-$pkgver.tar.gz")
sha256sums=('fb156d9bdbe4ede9279ad9cc530aeb01dc25ddd4dc70d3fb4084afe2658ad8ee')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
