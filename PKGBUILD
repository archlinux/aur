# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='proxify'
pkgname="${_pkgname}-bin"
pkgver=0.0.2
pkgrel=1
pkgdesc='Swiss Army knife Proxy tool for HTTP/HTTPS traffic capture, manipulation and replay'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/proxify'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('bd88ee67fea984165999cefcbdfedb099edb61c82a3c99c4094b4cb2a0dbf971')
sha256sums_armv6h=('cc2acac8ab98fe7ebb93858934826903b0c7fc33f3897e357aa5c219025b8b32')
sha256sums_aarch64=('05dbbd10420345f6c6baa976d904323044333d2faa22697fabe84755667f3f5c')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.MD' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
