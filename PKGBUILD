# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.5
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

sha512sums_x86_64=('2e1217784faddbb6dec0949d79723f00770deb05e6d099d05846ee6dcfd550271f941189675a0363363682eaeb10ed5eb3f7d365f6a3855d7866d7cf55c85dee')
sha512sums_i686=('02593515e627a93fd1085d70c6832dcd8ef2b07a8b5a06a3addfa8aecdd8e74006c1f7cd239a6d41ba111c433eed901ff6816b143dcefb77fddb8c35bcacabd1')
sha512sums_aarch64=('5fc638a3d840f5b39715c930929e4b7c28cd6ba157d7f2abacd08c7c206b457df1a93d634b3dcc7ad61618a004d3305bf91dff078788f761bb43ff7bdeed3e2f')
sha512sums_armv7h=('64dbbc4d6abdbf7686d70db929e36eed1fe31a5c828963775c37e21721e2fed0e24a7caa979e5311bf2659883f9fd862dcf025ee5ec03096500e569b4147efa5')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
