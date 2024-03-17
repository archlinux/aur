# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.2.2
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
source_armv6h=("${_pkgname}-${pkgver}-armv6.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('f35a167c00b9a6e6eb5cdd04afe410e045c7148115a9eddd5bd4f425a2dab087014ca97b8975ca4af3eb23705410b465d83c4f791e998470a444b87bc6cab9f1')
b2sums_x86_64=('895d6f027b78768d0bca3f7e13cea1bb24ef55a47f5adec54011632961294b14746faf3de43f3d088314ad94ff525eb640b8c142b79f4452c2bfea5df4c246a2')
b2sums_armv6h=('72828c4a8bfb602ec1e12a9ed331d3fb64fdb9e44f5e31fc7fb418570d6d2dac7f57e6b86dbe7ffe91081a2f75c147c3772cd1d5cb64469ffbcd611590964c7a')
b2sums_aarch64=('9df8ca9720a718c740444792ca254e3f9da67fa6b0527fa70815895ec79e630802a1c0a422ca51a54e7377c7e3a35602e2d1449b8202b2e0486c11ce208be9a7')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
