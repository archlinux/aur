# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.2
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('adbedd75e28c70d2b4fd06e011f56f118413f27c8a30f92e560e35aa1cd21d7841ee4e7a69d2489be9b0b3ad5ab3f6449f578ab616c18818053be847cbe47cc0')
sha512sums_aarch64=('0a773851d016eb45763ed9998ca42a9f7baa6cec02226185a87e0897e559f22ffc05e2107bbca5ffadb4dc87fcd2ba4fe68329bdfce5725486f872bd0ea242bc')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
