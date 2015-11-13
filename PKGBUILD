# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-yapf
pkgver=0.6.2
pkgrel=1
pkgdesc="A formatter for Python code."
url="https://github.com/google/yapf"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/y/yapf/yapf-$pkgver.tar.gz")
sha256sums=('7c85533f3603d81a2703e3e2fd32251efce2e3d76a442a9844d43a3e4f76ec79')

build() {
    cd $srcdir/yapf-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/yapf-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
