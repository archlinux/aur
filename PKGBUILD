# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.5
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
b2sums_i686=('dd12c17b3f5f2e1f695f962bc5cf6a949a0d9bc98924bf8ba5150fd98fa8c5a70bb7f9ecf45fad9dfaf095a5c7efcb6c7d1c58896098d94d957ee5db7993098f')
b2sums_x86_64=('47366f8edf9017c9178e4b2f2b6a7f911c1793bde04d62daa76fbbba657af8b5e68d1b107a07f1ee8832aaff99994e62a010ca9d51f2c270ed77444375b6e58c')
b2sums_armv7h=('c79fa1abb99e20a9dba88acfe3428597acdba8347a575baa7e65f876184eba0268386c4cda1c4893c1a2d7b01b6d35b864c3386da3273a45498b104205ebf823')
b2sums_aarch64=('e4d0dc36363d022c49ccb089f9b3d92091891cbf19a2cd47543bbf320f1a34f97bf5f09df184496a56ccdd8df4a78dfa5366cc97d51ea161c9c9e6f296212059')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
