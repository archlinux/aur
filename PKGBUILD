# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nuclei'
pkgname="${_pkgname}-bin"
pkgver=2.2.0
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}-armv6.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('6c5c3b7eceaae27f429b0a31d830f34cfe304d206d9a38ec0e8c2ae305765df6')
sha256sums_armv6h=('a4113ef5e6fd10fd2dd83b58fe6c6f6e075beaa81053e2b25be975852e6a4203')
sha256sums_aarch64=('a1bf98f572bc56b6d7dccd89ce5d2792988a2dc2319ba1e2c576def80954f9d8')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
