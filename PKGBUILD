# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.0
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

sha512sums_x86_64=('0b8ab9aafae483f2ade561cbf2dd82465b37570007e982891dd2fc8464deadc05fb787912e6f01df6b509321e3cdfd27703d31582926582ccc7fffe321d868d9')
sha512sums_i686=('f330291729580c5609b6e3e9720504af3fcaf51d663a3d2d4235542d3ae8793f3ce967df163850245ce9155e4ad20b4a184a0a4bc35577dcdd714e4cd72fb5bf')
sha512sums_aarch64=('99650af2d4e2f9d4e5d3beb56e216c7d5ffc1c3c9f1713f270b62af9951a16c766c8e2f1db5b01d79dea7a1a5187d46ed6f0a70fec0e2dbbeccc75b4ab623011')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
