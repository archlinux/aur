# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=pyfeed
pkgver=0.7.4
pkgrel=1
pkgdesc="modules contain tools for working with syndication feeds."
url="http://home.avvanta.com/~steveha/pyfeed.html"
arch=('any')
depends=('python2' 'xe')
makedepends=('python2')
license=('BSD')
source=(http://www.blarg.net/~steveha/${pkgname}-${pkgver}.tar.gz)
md5sums=('07fda8dba48367d63bfc12ba01e90ec8')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py build
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/
}
