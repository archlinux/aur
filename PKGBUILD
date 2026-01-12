# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.12.0
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
b2sums_i686=('fc54ecfc9422f205da673b174dfd0ebf3254e2f68f40fffad6136051639487c23c4b19a6c23a25f8bf397e2f70dc601ddd0092e2e0a719c853f8564382c6ac80')
b2sums_x86_64=('821f93f916fc28c682c77b378e7f16c7836f455e8c8a507c828b6a56dc587800d37946e387e5f0918914af990031f2d8d526332f277138cc065770c1fcbd6c51')
b2sums_armv7h=('7efb9a90a93db9920cdac565be679d9d5f14b90df5b3dabe733bfe4e6fc135b6d63d5f2cdfc364e8ab924857802f2417264d09263f2d552aa98625d5e98d16bb')
b2sums_aarch64=('32a2fd8806664b04f7f37b0655dd0acd82a0e6c58cc5980b54ea6a14212cb6ae3c9177bef7994ed2a672d77368e801e1c6739112901b1f3a09ca405f25e42509')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
