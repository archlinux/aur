# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.11
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

sha512sums_x86_64=('fa07c6318070d303d3fe786e4cf8f5284c36733a49c5482cc0e5a5b88daa4faa654e82fa72c78362b4cfc4c9ba05c6a56c4aa624999fd7681d028b9e994ff103')
sha512sums_i686=('c5f2a53a6885334f7919200376ade46220a3d34f1000bb5ed08acb82076ac0588d8454d7bc1780ea41ff07fecf7e7a384945b5462f2afc73b81e31f375c9a15d')
sha512sums_aarch64=('8703bfe34d9f33608ab9a41cb1c4fe761d60933c68f30aef5be2941442f83e4936430ff2ed477f395d125aadd3402034f2264d60b7dac642a8fe42db945f55f0')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
