# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.7.0
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
b2sums_i686=('736797e71eb2b807237b1ee1e16299fc07b571374820dc1244444104a6b1cedc34be14516ead9ef10b3ea7fed8e78b3ddd5acaedb37d0bde201ee69b86c51216')
b2sums_x86_64=('b77988d8582006955879fcea966e22d69e3c7cbd20e5e242f1617c173ced6a789a8a2538f10bbbeeae91e9135d0233024e80a86eddcccc4fe247225323e1b7fa')
b2sums_armv7h=('a52a191e2105fb4ac48e7ab3bc012e57bf8990f33f4c470839da12f05a4fb4dbb12bc9826576aa0256a2f5f63bd40b10fdec27efefe0ed4f44311e3d81632075')
b2sums_aarch64=('6d945fde882d9b8170c212f065e7352bed18ba3137fac3b495437c34bc033fa3887dac8b1767847dac05a684d8a9f4be32844e46e7fb3096c92cd4189dee1409')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
