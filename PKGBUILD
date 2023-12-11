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

sha512sums_x86_64=('8b31e50af8b2357d40b35d48b2316e4f81e1d3208240a7ae241f1f09993d04b57a5c69e65f1125cbd5818c601184e1f912bf8650a8e7b6fd7a619207aac0ad3a')
sha512sums_i686=('d6ceda4b5460a940b67fd48152c950429ca5229fec1730bd8d170020fcbb59c5031c03272193268637bd4df1e68257563221adef2a71fbb561f6dba45aa9ce3c')
sha512sums_aarch64=('0a637ce46e853ba626bd0e4673dad5425905ea5f14fa1b74b13410e7482279c52985320e463dcbee6cb1480e131b34dc0ac55852234759ee3bf1dc635642aa40')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
