# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=4.0.0
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://source.heropunch.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('074856d402d98416ab52a0d737fa64ece68162ec42b234791b936f6683f1cd4e')
package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-f13ccdfec40eb222507aecb4a077715242ce61a7/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
