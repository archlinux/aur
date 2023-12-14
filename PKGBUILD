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

sha512sums_x86_64=('f5915bd8e2f4567ceee7e527c93209e7e762bec2c671d7a67a7847438a1e287675da023fd65dbfa3be98372a88aa2c263b41ee7ae347978fe636b3aeaba0f042')
sha512sums_i686=('a6296ca801827c5ec1e1521ff7f0c4db3289b30f551e41d028e43d9cfcc368c40836355a67e413322dc37348c1b201bf6ec8832ceb6d5392b7a2d51dbd666f4d')
sha512sums_aarch64=('0b79add7b28474842f2f3790746db7faf7ba7cc66f58ac268cbba82b7ddb9dac60cb0676e918dd7b4fedf43fbcee0294c807892ebb2d96b4dd300eb6223674a3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
