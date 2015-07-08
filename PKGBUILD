# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python2-roman
pkgver=2.0.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="http://pypi.python.org/pypi/roman"
depends=('python2' )
makedepends=('python2-setuptools' )
license=('PSF')
arch=('any')
source=("http://pypi.python.org/packages/source/r/roman/roman-${pkgver}.zip")
md5sums=('aa71d131eec16d45c030fd06a27c9d17')

build() {
    cd "$srcdir/roman-${pkgver}"
    python2 setup.py build
}

package() {
    cd "$srcdir/roman-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}
