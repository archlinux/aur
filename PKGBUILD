# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=3.0.3
pkgrel=4
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=('6dc997b4038e5b0e688e1f8c04c7e1af6f993ffa05f517d0b36c33cf308735a4')
package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-230705fa6fa07c60bf32d651995d4fbe1d637c2a/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
