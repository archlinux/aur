# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_shortname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
sha256sums=(83ab8bf2d68b54967a3c1525d25dc6a8210ebadb30cbd6592ef61001731a288a)

package() {
  cd "${srcdir}"

  install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
