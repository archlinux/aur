# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=subfinder-bin
_pkgname=${pkgname%-bin}
pkgver=2.10.0
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
b2sums_i686=('fe9a5729e5cdc3187f7a695f868a97f8538375894f2688c660119258b0daaa3ee823fbf45866930d1dfe1f4115c025adce7ca0793dea568a9c07629697189db6')
b2sums_x86_64=('9f00bd144548a62fa6636a76790f7836ea9830747de259d7d2cb17b9c91b078ccc0d23c7212090790cb01a74d6103baba6d9fab12c5d8efddf2c3dba8ad7268d')
b2sums_armv7h=('29070f29c458b2316fbef65a7e977ddd066b70383072cfe96b4e4b93d9034ee8793ad958eca757478301010a569303386837655d410fed56742ebfd031110a2e')
b2sums_aarch64=('d77a97988e637670de98b66275468b47c55fccc258a29c9cead9b21420895571ac9700b35e8213fff712962b99acf7483c843813e44b868c30790d2cf9708d11')

package() {
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
  install -Dm755 subfinder ${pkgdir}/usr/bin/subfinder
}

# vim: ts=2 sw=2 et:
