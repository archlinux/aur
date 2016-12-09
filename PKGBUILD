# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://gitgud.io/dtluna/pygnusocial/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('b1adb8ac9f9dca28d7d6bd27dc9124d5')
package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-cdf4d314ac33ae6c5be6aab412845a70d6a5bd25/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
