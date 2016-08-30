# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkg_name=gs_media_bot
pkgname=gs-media-bot
pkgver=1.1.1
pkgrel=1
pkgdesc="Bot for posting media to GNU Social."
arch=('any')
url="https://gitgud.io/dtluna/${_pkg_name}"
license=('GPL3')
depends=('python' 'python-gnusocial')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=v${pkgver}")
md5sums=('1ecc4277131154410fa5be0fac1faf37')

package() {
  cd "${srcdir}/${_pkg_name}-v${pkgver}-dd809a38b3428a0933a1144f6f54c2911e705ec1/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
