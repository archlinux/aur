# Maintainer: Joshua Leahy <jleahy@gmail.com>

pkgname=python2-www-authenticate
pkgver=0.9.2
pkgrel=1
pkgdesc='Parser for WWW-Authenticate headers'
arch=(any)
url='https://github.com/alexsdutton/www-authenticate'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=('https://pypi.python.org/packages/a7/2d/5567291a8274ef5d9b6495a1ec341394ab68933e2396936755b157f87b43/www-authenticate-0.9.2.tar.gz')
md5sums=('42557d5d1f8ea37996e666039207d902')

build() {
    cd "${srcdir}/www-authenticate-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/www-authenticate-${pkgver}"
    python2 setup.py install -O1 --skip-build --root="${pkgdir}"
}

