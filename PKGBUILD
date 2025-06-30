# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.4.6
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
b2sums_i686=('f2b3cdfe44a82679f1141edea946a41a13d1c3a495f93e85f8a5801d58dcf0c5bc13db2bafcceb46be34163d0c386b16fb73d3cf347f0a87940da24e6ab2a5fb')
b2sums_x86_64=('fd5c29529c3b1b923f54fc15ceedf1857075bddf9f4a7b6645e2e5583006c2bacb1255d7152fc4c4ac3b087fdbcc5af78c9e65942569d0debca30158d5d565f8')
b2sums_armv7h=('55991496ca9749ff338bc8a62fe1fa7738b3289473e963cab6602b278be284421f6e4945c1e520d60f194fe6752a0be3ddbf7a49077b72e8318d675edb906af8')
b2sums_aarch64=('66f3208f5aa3b72afa1fd54920bd92310670993f51e360d5bd54d448c3f776c535862d919826c0f80b34e3b70b32f293de9155f6af2086d396cf86460068bbf9')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
