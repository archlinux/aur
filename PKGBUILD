# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkg_name=gs_media_bot
pkgname=gs-media-bot
pkgver=1.4.0
pkgrel=1
pkgdesc="Bot for posting media to GNU Social."
arch=('any')
url="https://source.heropunch.io/dtluna/${_pkg_name}"
license=('GPL3')
depends=('python' 'python-gnusocial')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('f8850266c8667575cf683fc417356beb5c72ff54790316fd492801f58344712d')

package() {
  cd "${srcdir}/${_pkg_name}-${pkgver}-5b961743c80bf76872ce6a4e55430a5ea78bf934/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
