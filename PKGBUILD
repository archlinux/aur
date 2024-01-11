# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.7
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('04d77dbc915818b8197c5868900309d8ff1857e90b61a91c48ab4a0048a6c6389818ae107654670fcc775d043f4e9cb8ed1399dfde6d25245abd1d6d5e5a1da6')
sha512sums_i686=('7226c81da93b151ca513194a94978b5cecd25b1382cb8b3ae4bcd5d9fc9d44b8235c8445109bf39c286d25fe278daf147802ca4e50276da15cc276ffb5f441d8')
sha512sums_aarch64=('abb4e7101ba2df82354230bfdcbe47b018781eb4185cea50c406629e0e8e83661222c324198ea8f5769b5e333a69714de359cd850e4aee0a0c0bed79570f54a6')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
