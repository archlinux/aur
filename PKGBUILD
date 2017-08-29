# Maintainer: dtluna <dtluna at openmailbox dot org>

pkgname=safegrabber
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI Safebooru grabber in Python 3"
arch=('any')
url="https://source.heropunch.io/dtluna/${pkgname}"
license=('GPL3')
depends=('python' 'python-requests' 'wget')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('0a3b7efbdf8f9102174ae61f4f60015d7f8046d56925fecf8128c6492b4cd603')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-54017efd30a4a89afaa48ca7d3c680cea2c2d0c6/"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
