# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.8.0
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
b2sums_i686=('b4df6ec69128c1ba6921985bc302a5b383f1a986dafd192d5be919ac4fe483539377dc60a7f38e98aa4000400ecd6f7131a75594a45a53b04f79f89522754c5e')
b2sums_x86_64=('083fd8d7047ff73696cf1a91a014654b2368f748cc481edac66bd5a0d2ca028b31c6a9c36a4cce4984e0ffcf440d73179fcfdbab29f87e7665da58f205c33872')
b2sums_armv7h=('bbf16815d21ad218fd94e35110bbfa08c398a728a423a104e60d360343483b065eb87e1567a2c8dbd7d9b0b6cd02249106be6a7da0e58943ca49f0e7f90c8ff5')
b2sums_aarch64=('05b47016a84e2ff998dc6043d04fa5ae527791b005e49e4da6352c09608d45231b1391b93dfe938ce125186223933cadad7e9a8260effaa8bd76634f7a0ac85c')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
