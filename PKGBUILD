# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.9.0
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
b2sums_i686=('42cbfc75a81a0f0b1ff2695297d79591b598816625786efdc020ab5ec898987599b8e7afa57f39c45e57f650e1bbe95b426e6eea748e834e7525bdd0839e2cf8')
b2sums_x86_64=('bbad51a6991491748d6d755b4ee0989733ba3434a5233f7fe4690679f423d5cbda4373edd42e5101064cc886135bcfd1cd83bfc58de363e0e9f19fad753868db')
b2sums_armv7h=('c3b5933fdc1b26102378d96a2d1e7336a48c4eb7920efc93951c98bfc1eabf48a6704906b288ae249e50eb6f1890350b6fd69c1e5d145d60fc44d8deaab31bef')
b2sums_aarch64=('205a718291dfccd2c3eaf101e59a090929c9465971d18ae6a570f6caa59bf51b18f813d15f219f318f8e911e908a29bd2ca96f3abe1a23732674e0218fedef35')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
