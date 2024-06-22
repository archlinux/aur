# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.6.6
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

sha512sums_x86_64=('1416cea93679a86245de89e8859ce98402927dab703da9816cbd2ac161ac0724d01168480bbf00573b9e9065fdd98fe3ef72ffabb271fbcc52022ec60d9a466c')
sha512sums_i686=('3ce55ccb4e1fd679d67950a7156f12ac3e7e4e75d0a34d55efd75b3d6eaf524703205945c49c270dadb0674044be6c25441c1f83ada2cc37ea1b4e17bc2d75fa')
sha512sums_aarch64=('450d76cac850d95900fcced45d09b4721146c56857f5573d9a7b9bed4cdc7af1c338d0bba7d36cec1923bfa2be0515a37c04f3924792f9fb89954fcabb7487aa')
sha512sums_armv7h=('be7607f2fdff040db09a5aba4883dc54a1ea477d80893320eb0ce1035858e46587115432f6ea5ce6a6744125c0d804add1dea8cc87f082d3e6aaecbc99bccfc9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
