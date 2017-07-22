# Maintainer: Renato Candido <renatocan@gmail.com>

pkgname=python-lesscpy
pkgver=0.12.0
pkgrel=1
pkgdesc="Python LESS compiler"
url="https://github.com/lesscpy/lesscpy"
depends=('python' 'python-ply' )
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/32/38/a55150ec018cf6fe11012bf1d988cd737af7f82227e4ac753619f0fb27a4/lesscpy-0.12.0.tar.gz')
md5sums=('0a5a3ca4091ad3fb62ac6f705f8463d4')

build() {
    cd $srcdir/lesscpy-0.12.0
    python setup.py build
}

package() {
    cd $srcdir/lesscpy-0.12.0
    python setup.py install --root="$pkgdir" --optimize=1 
}

md5sums=('0a5a3ca4091ad3fb62ac6f705f8463d4')
