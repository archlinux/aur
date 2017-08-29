# Maintainer: dtluna <dtluna at openmailbox dot org>

pkgname=safegrabber
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI Safebooru grabber in Python 3"
arch=('any')
url="https://source.heropunch.io/dtluna/${pkgname}"
license=('GPL3')
depends=('python' 'python-requests' 'wget')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('3679bc79440a778811746958ba8b78a1a70f807c3c72c2fa5b44d69254763b50')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-f0a0e4df49d13c7d9ad058548d47ab42014d5135/"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
