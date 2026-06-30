# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.10.0
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('6b4a017a0b06539a82cb8d8759d76f65afaf60ad01c88dbb96377130239974816e375aadcaa29097fd022decae84588925b7bcfabe007c57e8397501f142c58f')
b2sums_x86_64=('0203a3b4a77f9997b223d424f1de8055f40aaf4c9303a57b4504957ed2364c695a8f4e0ba3b853eb55b69fdf4a09eb7f8f727493ad887b355494f99636c817d5')
b2sums_armv7h=('57633e8844f5c38758ee76db75077db26b2ce90e97ada6cc9c96cd40e3b5c07308fcacc755f1f40f2ae4d9de743e53c629f3426f09ba23b6e583b96509ea04ee')
b2sums_aarch64=('19272ded3ad147b16bc29cd8767ef027d8bdede73c5ee6ca6957203ce0bab7425765f17609a3116eca4272e954ab34b6ca4d25191012187b24b4bd1f31667d5d')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
