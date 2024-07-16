# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.5
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

sha512sums_x86_64=('29858f4777d2dd848369d6adf960bbeb697f5928329fe0bac9cf255e32a20ec7c2e4d0d545e3b5ccb8f38de61f1f4e843bf381ab5f89a724601146a18e589386')
sha512sums_i686=('eab41448aaced836fd312e1f83cfa270f407d27ac060809f20d7beb93cb742d3bcb1390d3778a294ac62e0a6063d74503aa52b9f54550c415c554481110b476d')
sha512sums_aarch64=('d4d0758a298c555a30ea4cbcd33fc038f77db0000a52978df0315a09b5a84cb14c5195082d0f81436a815b17daa4c7aa84d06b48a902f139f963fe62ca312afa')
sha512sums_armv7h=('3d28842ec8f0b718ec1265e250f8fe1e2066b983b3cbe3fa71fd1ca06026388793a334d04df43232199d8c8bb25df84ba6fed4016a321212a0cf94eee0db58c1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
