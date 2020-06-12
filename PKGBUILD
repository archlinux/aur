# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=ssh-chat
pkgname=${_pkgname}-bin
pkgver=1.9
pkgrel=1
pkgdesc="Chat over SSH"
arch=('x86_64')
url="https://github.com/shazow/${_pkgname}"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-linux_amd64.tgz")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
sha256sums=('7231019c043f16b4bb93c35ad9f3d84ac786b6b6749b043b2dd697f85989ab5f')

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}