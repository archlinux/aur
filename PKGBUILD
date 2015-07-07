# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.2.1
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=('https://pypi.python.org/packages/source/y/yapf/yapf-0.2.1.tar.gz')
sha256sums=('310e68e2b30138d40b23502c01985bce679b0256b93af6ce7f8018493747f331')

build() {
    cd $srcdir/yapf-0.2.1
    python setup.py build
}

package() {
    cd $srcdir/yapf-0.2.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
