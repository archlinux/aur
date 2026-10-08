# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.17.0
pkgrel=1
pkgdesc="A subdomain discovery tool that discovers valid subdomains for websites"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/projectdiscovery/subfinder"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/subfinder/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('c699be7ccfc40564b59bfa217e254c9553678f343466becebad5017d81310d7b7519837a9a25df2e09e16b6e1bd5a209d7aeb039662a206dd8966b9697c02ede')
b2sums_i686=('ad5c4ec6ae4ecc54a23574eb261b063544f97dc2c8b2cac6012a4e3e8d87fde78ee6fcec38648f2a23ba52702533efe7a67d8a99324f5d063d51d470f28c0313')
b2sums_x86_64=('d3732028154ebd9fca39487846f1d85a3f954249f7110f4a6068ae66d3f03d5c2c248b584687e4325aa4c6194ca3945ad806944f4cae7d0e4cd982357f7da5be')
b2sums_armv7h=('73c274b197bf517c4282821854d4805ce1a9109d2762ab4640ca8a0b9691756597b2595d798de1154d1aa4db8e4c80496b68a81d578f69c8280605c99612bd97')
b2sums_aarch64=('9e4390c28f5d1043a1d29be5ae2e03c18d49d9872a3e62c8880606e33ba4bbeb7948a6b9685f18b0fe0dff9e625dae9900ebfcf02679063bfb156968e5bb95f9')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
