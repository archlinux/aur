# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.2
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('b5e53a2ea821a004244703252111f5e886e088b05094a0a3c6ddd3f10e1523034b2f708bd0cbd850cef6f1a3a9a7338849f5d98d99b7c8dc14e351ea760241c3')
sha512sums_aarch64=('53ea73003eeb667e13c986399e294ad6a1682efd5f73b9af19cc495a01d180bb5d57528fc70b8a7c478b1c55b3d182d06dee42f041ab4d41d9ae3fa7f052a3dd')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
