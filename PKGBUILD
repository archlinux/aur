# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=1.0.0
pkgrel=2
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=(83ab8bf2d68b54967a3c1525d25dc6a8210ebadb30cbd6592ef61001731a288a)
sha256sums_aarch64=(cc14b1f436a7a1b10c65b5052b71c8fad51e09eded8de4a892087f5e6cdd9f6d)

package() {
  cd "${srcdir}"

  install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
