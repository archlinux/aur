# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.8
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

sha512sums_x86_64=('3653ff4d677e948a4b1d10d8f5ed0e743bae72a2e7d4ff7a307c877ecc56c1e2d8029f9beb42a72f79838a01ca9c985ef75c197811a0600a1d4f255e5b7dbd88')
sha512sums_i686=('8eaa9c064dc64e38fb2717b850a0f6a16f9b717fffb6b5b0cf3aedaf5e9be037c1fb0bbec44267f790fe05dc5581d0176a312418080e62f26e52d9c9a3ec56da')
sha512sums_aarch64=('1267e0858fa08f4328cc3e99cad92cd55d2337c060a60b9b8d7bd2d4b21b46894554c13577c92a379ce37be77e2f4f1b5ca83edae7c98523a45a8f336f77edbe')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
