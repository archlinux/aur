# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=idnits
pkgname="ietf-${_pkgname}"
pkgver=2.17.1
pkgrel=1
pkgdesc='Check internet-drafts for submission nits'
arch=('any')
url='https://tools.ietf.org/tools/idnits/'
license=('GPL2')
depends=(
  'aspell'
  'awk'
  'bash'
  'languagetool'
)
makedepends=()
source=("https://github.com/ietf-tools/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('195ed8c9bfd38fbaf1ecb674a894f98f43be774dfecc37da5ef953ccba99ce76')

package() {
  cd "${_pkgname}-${pkgver}/"
  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/"
}

# vim: ts=2 sw=2 et:
