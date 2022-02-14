# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=func-e
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="func-e (pronounced funky) makes running Envoy® easy"
arch=('x86_64')
url="https://github.com/tetratelabs/func-e"
depends=()
license=('Apache')
provides=('func-e')
source=(
  "${_pkgname}-${pkgver}::https://github.com/tetratelabs/func-e/releases/download/v${pkgver}/func-e_${pkgver}_linux_amd64.tar.gz"
)
sha256sums=(
  'eed1bac7d10c88c3568ae14caad981da6552e67b0a7e11da50989735e21fab90'
)

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
