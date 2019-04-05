# Maintainer: Christoph Gebardt <cg@zknt.org>

pkgname=python-www-authenticate
pkgver=0.9.2
pkgrel=1
pkgdesc='Parser for WWW-Authenticate headers'
arch=(any)
url='https://github.com/alexsdutton/www-authenticate'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=('https://pypi.python.org/packages/a7/2d/5567291a8274ef5d9b6495a1ec341394ab68933e2396936755b157f87b43/www-authenticate-0.9.2.tar.gz')
sha256sums=('cf75fc2ea5effb0f9342d7de7619b736f2a7d4b223331a53e296863a286e9dcb')

build() {
    cd "${srcdir}/www-authenticate-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/www-authenticate-${pkgver}"
    python setup.py install -O1 --skip-build --root="${pkgdir}"
}

