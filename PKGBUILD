# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.8.2
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://github.com/google/yapf/archive/v$pkgver.tar.gz")
sha256sums=('c9bda991644f6e08274ef7b4083be7f3677cf96d6fbf21e1541c909d26b5ac32')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
