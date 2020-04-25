# Maintainer: RubenKelevra

pkgname=python-baseconv
pkgver=1.2.2
pkgrel=1
pkgdesc="Convert numbers from base 10 integers to base X strings and back again"
url="https://github.com/semente/python-baseconv"
depends=('python')
license=('python')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('775abc86664b1f2867cde7eaded5561c7a2b445df98ffb50265bcfaf33b76e1cc2baac102f3841ca938f65c2f79715a6bbb2521db04c8aede0dbf3912ee8250b')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
