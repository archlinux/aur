# Maintainer: Renato Candido <renatocan@gmail.com>

pkgname=python-lesscpy
pkgver=0.13.0
pkgrel=1
pkgdesc="Python LESS compiler"
url="https://github.com/lesscpy/lesscpy"
depends=('python' 'python-ply')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/c2/c2/515d710df11dd4edb07b685e33e8622469593d44cd798534af24f8e0147b/lesscpy-0.13.0.tar.gz')
md5sums=('d91047bdc5b8e2ff14ca43686101978a')

build() {
    cd $srcdir/lesscpy-0.13.0
    python setup.py build
}

package() {
    cd $srcdir/lesscpy-0.13.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
