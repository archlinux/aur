# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=xe
pkgver=0.7.4
pkgrel=1
pkgdesc="a Python library module designed to make it easy to work with XML"
url="http://home.avvanta.com/~steveha/pyfeed.html"
arch=('any')
depends=('python2')
makedepends=('python2')
license=('BSD')
source=(http://www.blarg.net/~steveha/${pkgname}-${pkgver}.tar.gz)
md5sums=('eff507b7a3700c93bd5ba756d4a6f457')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py build
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/
}
