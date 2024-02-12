# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.1
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

sha512sums_x86_64=('03ef4b75bf71b515e21375f4c6e031a98b2f841b5cb1af9c0e8d7d3be39e6d16a40d387b5130e33ab370adbd71b303f32f53331c2509fecea7e249ca8f9ef67e')
sha512sums_i686=('03ef4b75bf71b515e21375f4c6e031a98b2f841b5cb1af9c0e8d7d3be39e6d16a40d387b5130e33ab370adbd71b303f32f53331c2509fecea7e249ca8f9ef67e')
sha512sums_aarch64=('e6762595ab758c55862b32cff6c520c354ce072e872a2ce142c74235e2c5faef06d24cf751d95b4e1375f64cf2d77f7bcd3172a05585c222225a8fb149511a52')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
