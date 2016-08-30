# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=1.1.1
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://gitgud.io/dtluna/pygnusocial/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('514e11d68cb61c3a2c5c9e9c57842a90')

package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-a7c57b90b000c879863eb1918572d71607ccd18a/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
