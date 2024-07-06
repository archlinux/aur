# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.3
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

sha512sums_x86_64=('1ed0855d10a0fb54d11b90ee48b0cf612cc4e89ab809f62e051106ceb5ff1c4355780b1bdd16abd7409659bf937eb7d94048dd9efb59c36900bc1b097b9ee8ef')
sha512sums_i686=('e861ad07b896a5dfc42e3a86bf4fc10fdf46198fecbb0d0039fb0234db913559586725098f2eb8e220a75977a62eb97ac881292cd214a3fb91b72b6b13702c5b')
sha512sums_aarch64=('2c957c1f6382fa1ba3e40eecd9b65e77279a0521d0e61287991fefdf0ec56097004c2db28e07ab43f123eda1a30bb988d723c8a05e9816d33c94dc4f513966fa')
sha512sums_armv7h=('8a8e0d5fbf47fec3a4e22d7db35c5b3495f5f81cc688047a277d56e957aa4041034d99c2b9e8ba4e2bf9ab3eb5dc3c4acd1f29a0718929e36f8d84e2d04c919b')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
