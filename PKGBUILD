pkgname=python-lesscpy
pkgver=0.13.0
pkgrel=2
pkgdesc="Python LESS compiler"
url="https://github.com/lesscpy/lesscpy"
depends=('python' 'python-ply')
makedepends=('python3' )
license=('MIT')
arch=('any')
source=('https://github.com/lesscpy/lesscpy/archive/0.13.0.tar.gz')
md5sums=('1c8ef0b933322e53342f6f9b0db297ab')

build() {
    cd $srcdir/lesscpy-0.13.0
    python setup.py build
}

package() {
    cd $srcdir/lesscpy-0.13.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
