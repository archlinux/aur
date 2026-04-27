# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.14.0
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
b2sums_i686=('3ee7d8221533e9754222505861ae7c205cfa43d551c36949243934c23453c2ca4de197bac8424ef5b40a690b408a5e9c7d2bdd22740873ac53014bd293c68a0b')
b2sums_x86_64=('5123181ad42247ff57faae1764365c40ee27363c278af53e51fc1c9d6bef54c4825e54625f5e2801bebe3ebe99f312f32b9f327ca09dc9917422ebe53794b393')
b2sums_armv7h=('75b7456973b6c55314563a4008f53f8b9be40eeb213ce51aeb3ae880df7b2bca3f0358a2cd6f5d824db5d83eef09f398e0bce0fa3b9f5d48a5b13c656bb11d72')
b2sums_aarch64=('0a55d82ac7a5f4a7c6459f92f27272256da8cf0cda466cb7212780e4288dfbba938e320fdf5b5376f2b558d082de6a58754e7a8c0e0303a082a93c54a25116e5')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
