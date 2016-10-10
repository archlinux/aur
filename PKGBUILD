# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkg_name=gs_media_bot
pkgname=gs-media-bot
pkgver=1.2.0
pkgrel=1
pkgdesc="Bot for posting media to GNU Social."
arch=('any')
url="https://gitgud.io/dtluna/${_pkg_name}"
license=('GPL3')
depends=('python' 'python-gnusocial')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
md5sums=('45761230e8e1473a0d71f4f5aed9e412')

package() {
  cd "${srcdir}/${_pkg_name}-${pkgver}-c6d15ed8425e888377134a67706c29999f57fb9c/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
