# Maintainer: RubenKelevra

pkgname=python-baseconv
pkgver=1.2.1
pkgrel=1
pkgdesc="Convert numbers from base 10 integers to base X strings and back again"
url="https://github.com/semente/python-baseconv"
depends=('python')
license=('python')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('65499e46757260d15363cacd8519b62b6bc2a1d1f9bf17abe5a0a8065ca8fbe14639bf803c999139b7e3f850462340c9cc759840a2657ac3517851d6b361f5c4')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
