# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-cachetclient
pkgver=0.2.3
pkgrel=1
pkgdesc="A python library, client and interface to Cachet's API"
arch=('any')
url="https://github.com/dmsimard/${pkgname}"
license=('GPL3')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dmsimard/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('976f7322595c2d172b7915ea74c359ca88f453b2586d866a7c0dd86266cbe376')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}

