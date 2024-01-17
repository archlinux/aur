# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.9
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

sha512sums_x86_64=('c37f02de107d5024f61bd10eb67652ebd773da3315f68f3b8797a5a8b7b6ab361fd2733e27c91865823aef4033efe6c079fb7b5df62533da21e1bf274d4dc03a')
sha512sums_i686=('2e6727e35fe04b6b0c66f40ba07e7a14525f219e3f0c7bc66602eb1bbed8f9adfd30a8b599946b677a5ff1a2207ca56caffce12fb06588b849a77cf851d428ae')
sha512sums_aarch64=('17cb0c7945024523b8b76e919625e8832fb2d7c6b886a132e7a8abaddd02bfd26f66698ec0f576a9da6cb52c5c8277b5f2f6e085be5a6aa4c567c0912abfae39')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
