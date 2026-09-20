# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.4
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'rav1e')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('13c283028c7761c3732bf8431d39731cfb30a1e8fe5b3c2b26cd91ef6a52f3efec120ec2c740be88b31254d5f898ee7bc0e6685d52baaaad8c5a755a92653e9e')
sha512sums_aarch64=('dadd438a0923e475e02ff8b3fa17c787e947e2a3d1ae1cdcf97ff349d17d298a43de644166fb19e8779c6d5863b3dabe3b9e384067b8d9cf4616e3a47cf10c53')
sha512sums_armv7h=('5019faac646b6d1397bde0d24fa1d27c84f93b2f896d614402900495380d2cbf7486206496c47ad336c650bae5b25c78844f212b7e1336543c12c616285d1abb')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
