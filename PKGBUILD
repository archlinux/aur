# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.5
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

sha512sums_x86_64=('7895a481f877c3cec3477bda5ab3e48026c785688d5e5386515867105e0d255543787b32a1987ae52945fb8a8390fa861147b0daf31e95abaaae387e38ec9a4c')
sha512sums_i686=('2605d262fd278e5e28ce7ec87c79264a4698ad3812be7332f8735613f6fc2fbf619a510c15e2cd24fd2ba0b21a91ef9263047337981aa0f88cedbbea7279f5d2')
sha512sums_aarch64=('fcfcbcb3071fc324baccdbda13ae20a9da940193830acd3e64b1cae98052dc5a68ce59ed0286e0126c7826d62b93490811fcb599d578a5de6b51456c9fd3c0d4')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
