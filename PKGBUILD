# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.1.0
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('d182802c5c14c854678169259c2b4a32a83bd631689d801fa65e82ea4ed599c93c94397ac3a4498f14f29a46b9c9cca1a1a95b3b3d2146f075c4e428ecc56e33')
sha512sums_aarch64=('989019f849e9cc21ccebf1238570f4a4dee4426447c49d732246b016b4617679ece9236a120686bf79e11852e38be7652507b78bea5e3445408909cc70416e38')
sha512sums_armv7h=('250823fc68d458e8c558a8788ceb3842bee6472f0a2cf8b3a43282c87ff425cf9b316a31ebe2eebdd90dea9dd48999ad3238bb082ee4158f31149eefaaa7555e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
