# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=idnits
pkgname=ietf-${_pkgname}
pkgver=2.16.04
pkgrel=1
pkgdesc='Check internet-drafts for submission nits'
arch=('any')
url='https://tools.ietf.org/tools/idnits/'
license=('GPL2')
depends=('aspell'
         'bash'
         'languagetool')
makedepends=()
source=("https://tools.ietf.org/tools/${_pkgname}/${_pkgname}-${pkgver}.tgz")
sha256sums=('1eef34b131d9c0b45090192f972db0b5dae15047271a7962959c8019dd8cc06b')

package() {
  cd "${_pkgname}-${pkgver}/"
  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/"
}

# vim: ts=2 sw=2 et:
