# Maintainer: Jose Riha <jose1711 gmail com>
# Based on the output of pip2arch

pkgname=python-imutils
_pkgname=imutils
pkgver=0.4.6
pkgrel=1
pkgdesc="A series of convenience functions to make basic image processing asier with OpenCV"
url="https://github.com/jrosebr1/imutils"
depends=('python' 'opencv')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/15/ba/24272ac57159cf255959f9298b8e42f00528be90ce4ccd274b604ae5e32d/imutils-0.4.6.tar.gz")
md5sums=('2aff9715fef016ae9a27f661db3d9f0d')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
