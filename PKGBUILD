# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.2
pkgrel=1
pkgdesc="Clash Meta GUI based on tauri."
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")
source=("${_pkgname}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('03ef4b75bf71b515e21375f4c6e031a98b2f841b5cb1af9c0e8d7d3be39e6d16a40d387b5130e33ab370adbd71b303f32f53331c2509fecea7e249ca8f9ef67e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
