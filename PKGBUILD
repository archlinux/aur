# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.11.0
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
b2sums_i686=('e5cb1a9573570163845610dfab1a1a9f38dd2a2e284a343dfc8b12ec496024cd5a69621667fa91c69a4c6a5f1261861ccfd0543f37c5c45128d8bc7d8e0211d8')
b2sums_x86_64=('e6da74331f1a776611b7a39952f7bb69f8ac759bc4d42b348aeb185ecd4a80a5a972053c62c24cd8304faf615960030bb5434342b358e38271679494b2598287')
b2sums_armv7h=('1aae016314e43cf39fd1613d59ded27b3eb200a112144c9390c5fa33f87687f2e83e31aa1b6559cae26045f2e5cd11dcbd88a91076ee88d45fcae5f673858040')
b2sums_aarch64=('23d76de9dada73f7cd8783d871bc54147dcb7b50817d4a6b10c9e7606b932e912611d3c9d92c987c0ff4c001ce17d1235ca772693a1b4f8f0b7909a83f32c70a')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
