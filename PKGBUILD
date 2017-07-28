# Maintainer: Jose Riha <jose1711 gmail com>
# Based on the output of pip2arch

pkgname=python-imutils
_pkgname=imutils
pkgver=0.4.3
pkgrel=1
pkgdesc="A series of convenience functions to make basic image processing asier with OpenCV"
url="https://github.com/jrosebr1/imutils"
depends=('python' 'opencv')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/a0/cf/5f19a892b73c1992b83fbe747556984e68b2c04a3967ab52ef093d89f929/${_pkgname}-${pkgver}.tar.gz")
md5sums=('8ffda750ffbb0f250b7a893df1c2f5d7')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
