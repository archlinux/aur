# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='shuffledns'
pkgname="${_pkgname}-bin"
pkgver=1.0.4
pkgrel=1
pkgdesc='MassDNS wrapper to resolve and enumerate valid subdomains'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/shuffledns'
license=('GPL3')
depends=('massdns')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('492fdfc44d4aa7790cdf1c850b0ed8211da39bbc783eda9fa77f4064100dbc0f')
sha256sums_armv6h=('c2f1bc1f4f2d34f593a3a00eb87b3f4ad85cc6986d532f56753b8a9c9e47f258')
sha256sums_aarch64=('e4faad7ab5e08eb012c1396dfd6f26e5a6a6327cd16159bd762ba8fcf378de90')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
