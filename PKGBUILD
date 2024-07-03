# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.2
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('bfef45200cca22f6d9a24b8ced040081b7b1687137858bd9e3b982a350d1d7f944a366e363c096b84780e2fb480ebb9a056784e04eca0615d1f79bb8730ade6f')
sha512sums_i686=('412ab24f59de26f0b6706c72749189839360cc5fcbe7eeaec12c88f9646246b233cde12ec5021018d8ecd3676b07979172663707e2b5b8de4fc236373d6c2b38')
sha512sums_aarch64=('7ac4100660139a1442e3d61a2eb2af27fee8161a2845a620bcf21c53bcc70d47e092d078e6a966e9ea15c785b364afc09cdc08d9cdebb1cc6deabcc76ba65d7c')
sha512sums_armv7h=('b3fa76b438254583302ad976e25ccea89b700d433b49f5d67037af65f2780d8350a8b2dc128427e4839b6b61c59c7202f3708aef566854a2d4124e64d5c89844')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
