# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=2.9.4
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('f35a167c00b9a6e6eb5cdd04afe410e045c7148115a9eddd5bd4f425a2dab087014ca97b8975ca4af3eb23705410b465d83c4f791e998470a444b87bc6cab9f1')
b2sums_x86_64=('30fc8dd84ccfd60c4dd8c5bdbe0455788734c3a7a9cc3c914a13490898188a843dd3686290b39ae29060d9f4f513d6d12601a8087d0c7e85b6643bd2c03c0b83')
b2sums_armv6h=('089fe246412efac0e0e3b459e96ebd672f1ea068698cf3a61db6e0a90602dde21e4b6492c0098915aef19323db09b528cfedfd00386810ee9690d0caa641841c')
b2sums_aarch64=('34d0de39afd7e7d146b6e5cc127c4940e6f5875dc7c9962353ad9f852c8cec1e1e95fe5c6110d9322ffb1cdd21db96908ccfda041453c30f92a1711b36b4f847')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
