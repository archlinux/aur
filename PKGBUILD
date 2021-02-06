# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.2.0
pkgrel=1
pkgdesc="binary diff and patch using the BSDIFF4-format"
url="https://github.com/ilanschnell/bsdiff4"
depends=('python' )
makedepends=('python' )
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/b/bsdiff4/bsdiff4-${pkgver}.tar.gz")
md5sums=('a0d047e91429ce67a3b0231facf41169')

build() {
    cd $srcdir/bsdiff4-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/bsdiff4-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1  
}
