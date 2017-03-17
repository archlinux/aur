# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkg_name=gs_media_bot
pkgname=gs-media-bot
pkgver=1.3.0
pkgrel=1
pkgdesc="Bot for posting media to GNU Social."
arch=('any')
url="https://gitgud.io/dtluna/${_pkg_name}"
license=('GPL3')
depends=('python' 'python-gnusocial')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('be5d2e963a3af57eb8c81228a1425f5cb4736042f94536dc0737aa4262972087')

package() {
  cd "${srcdir}/${_pkg_name}-${pkgver}-16ed8b175adf5cee749496b315f66abc90bc550d/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
