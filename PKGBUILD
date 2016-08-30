# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://gitgud.io/dtluna/pygnusocial/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('7738bb85b5784f8c56e4084a06bf0ded')

package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-f5d5e3cb3dd26625e6dfc1f12cea5b44817a1d30/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
