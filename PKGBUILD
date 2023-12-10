# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.4
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

sha512sums_x86_64=('4ebe02b466ef750756da75b317cac02897b32bb209bf27588469e22954daee5bfd06bd086cb689261c6b0cf4d03942d024a354bfd358bf7dadfdff39932edc4c')
sha512sums_i686=('5b4eced222722abeba2851958442f5c28c8414ff35e0e66cec483b59164726dd0a4e9d050d6bb941fda9a35d377684b88e36cdffcc15e3c7dcd9294234173ded')
sha512sums_aarch64=('9332ddf4653f8950082d0dc3a70d1c12f33a8df44cf3786a58bc76ac3e24ab20b72fb87978af0de9d3fa51014482a8ee0d918fa644e2b5b054a71a68985d1b8e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
