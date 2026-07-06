# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.11.0
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
b2sums_i686=('15b3c8ac6d01285cd617c1ace790debbeb63cb0752ba5bf2cd2f7f4fcc82fbba5ea15bab53eef38e09c429d25449bdc381cd565e7aa40f7549196064be17b6dc')
b2sums_x86_64=('20c85de73f955e12042b8a3480beea3afc16fa116320def4fb976ecd2fadb021b57a054fe227d9dc25f09ce6d4c039f5ec19560bad14ddb80ad1324d6fcfb8dd')
b2sums_armv7h=('a0a844d979ddac36e7b3392761df26b6f4cb14b4eb7050b79099b885a1aa7ac4296fd965393f9f9ae6f9d4baad13e02f57b846a1a014cdf31cbe0fce732dd44c')
b2sums_aarch64=('95dda4362c4d5af6186e92a8ca825d0c2453100232e33994a1ea6f5c5248aaae2fb6b3f1f307128d8f37dea7ac5c95b1c96624217c86a86916a3c40a6effd81c')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
