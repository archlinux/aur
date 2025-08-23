# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.0
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

sha512sums_x86_64=('9a9e1bbc3c1a211eaee4b3be69aa4592fb6f74fa92a7a653e1fd14333de725e3ecd1d03f40ea046ef371a42987243adbbecc5cb7a31dcade92c3df9a390f3f4b')
sha512sums_aarch64=('b5d66e730c4fa4adccb5d36fde2948035d8bd2c62721d98253404b75c04f941ee3263c977659c269cb1659e9dcb85df989e63f3541b90a2aa2232ccab60557af')
sha512sums_armv7h=('b034d4d69e65ab43da1c122fc3449bc79b82287620542ae7151c5d66cf27e94e8e43b6e15005ca0debf6e1d00b8e8020ab747d3bdda61f48292ee819b5c2e0f3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
