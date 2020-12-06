# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='dnsx'
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc='Fast and multi-purpose DNS toolkit'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/dnsx'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ef73632db6cb2fa6d1c1cb7c01070f33970a3f16860db67b8a27a3bc3f689cf5')
sha256sums_armv6h=('63184e1a7b880649597c06ad3ab62734b3d1af809a234de864cbd9d98774af28')
sha256sums_aarch64=('c711037d87e97c0891b923d37e1c6a50cd43ac88ec295f2eff7f416bf8ca0154')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
