# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=certificate-ripper-bin
_pkgname="${pkgname%-bin}"
_shortname=crip
pkgver=2.0.1
pkgrel=1
pkgdesc="A CLI tool to extract server certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/Hakky54/certificate-ripper"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_shortname}-${pkgver}-amd64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("${_shortname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_shortname}-linux-aarch64.tar.gz")
sha256sums_x86_64=(883f45afd42a00cd174a64b841198381eca5b4ba5a87b74189de6f9cc4ac721c)
sha256sums_aarch64=(e4ed19fd8ac32ee76096f338767dad7123742eee28c94378b53852e4d255b4af)

package() {
  cd "${srcdir}"
  install -Dm 755 "${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
