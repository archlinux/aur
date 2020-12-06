# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='httpx'
pkgname="${_pkgname}-bin"
pkgver=1.0.3
pkgrel=1
pkgdesc='Fast and multi-purpose HTTP toolkit'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/httpx'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('5cd5dba56a84d2acedb47f93272770dec0a1cf3020597bc83fbf0e3655b220b8')
sha256sums_armv6h=('cbdfa4b4862ec772bd70c5af60dc22df705e7c95c18b618444f628f747af0fb0')
sha256sums_aarch64=('4fde28ba2328e0f49ea301a7e1ab16b5fc2ae1545fa8a3a71b0aaea19e8fe651')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
