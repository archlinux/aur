# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.7
pkgrel=3
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('66e6be58f9a388b2b9887f9544811ddaf70d5695975bd44e2a1b29badc5f271cc2bc6f543bddaf3f9f8ce0be161ecbf54401b2941b27b5141620b56db0aa501a')
sha512sums_i686=('4c28c3bfe6030515607919ffcb6390299740400cc74c2d1688f16c8d474453107534e4b26cb2de24a59e25bc38f0b36c7451be6e45313e9e37b121ca70175bab')
sha512sums_aarch64=('4a1e09b4db4dc662f1c629778ba49d5f369f97f5a9a6308807365c3d8b4de4246b6d3586a6409c94d64e2b11b05bc7942b56cd9f56a98f66352187cd111e22cd')
sha512sums_armv7h=('9f16ed72e90d6e56c27e70f310edafa0fb95b5692b57b112cda256d206250a6f1745c3e3c1c28bfb0176bf6a41365801ab69e768a0419e891db6862509de983d')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
