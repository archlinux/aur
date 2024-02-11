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

sha512sums_x86_64=('b2ddadff23487b3218c7e094a07a5399361b803a66e32a0955b423efea78ccb41a32b40c29056b5a441342e73c4d4c71045f9c5a2a1255f1d4f74225436434f6')
sha512sums_i686=('1837f404ae8835277376c795c5a65d4e2c0023cc889cb361a7ba108a4a850771fdc8734ca45a9dd7527c769276e98b267f7b908ddb2b4716d38934d381a74fd9')
sha512sums_aarch64=('f861701318b4ec90cd7d130c1329a562da6c0b270de8317eeb5a8888285c7ee0e878bf56a499990ff0646581e98fb969cab00eec31a8a2e4dc545d148eaf1f94')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
