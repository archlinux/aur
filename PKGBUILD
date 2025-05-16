# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.4
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
b2sums_i686=('fc1a06ffddbf29b6220f247cd2194f22c08964fd8765415dcb3ee29bf8af922af949d9215d2210f158f3caaa75f1322dc3f62f06d9a166b3f7f9f186d0302372')
b2sums_x86_64=('1a8822e1f65701b12d4e77777aeb3c9e8d0fedccfc1a6321bc3b361d7ac0903d5b1adb67d22e446c4f88febcfd71e34382387e5539c5c7e19f28ddb4b9a24a6c')
b2sums_armv7h=('3c65d6cc4ea28086a448feaecf8f52025bd37293076b82f5d7f0b1d41c515d9e5d58b0776a84d2529294bfd2d1c61dc4f15ccf5fa53407ff1d45ec5503ff2e16')
b2sums_aarch64=('610f7cf0c17a3749d4264915ae60a3d30846f3b0529b84013dc954c3eb3e6439331d0f77566961d2ed3426e0442959e68af15e3e9800ce5cafa9dabee41b143e')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
