# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.5.0
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/y/yapf/yapf-$pkgver.tar.gz")
sha256sums=('18de4879f7c313706ae47def6f2450a45ff4f73d5f899d67292ade52e5e7fdf5')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
