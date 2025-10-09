# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.2
pkgrel=2
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

sha512sums_x86_64=('c2bba9af456332a605f4eb8b4b111c9ab3f66570bda0fe2943f4a7a752c3fe2a2ded4f3f47478deefd55c34584bc8df919b2e2e99ef453828fb3189a2c9330f2')
sha512sums_aarch64=('3a93ca8b5ca34c158eafaba949d198a9d4384129b8d6a854db514c3125f30f716f166e8bf50ad71e3e01b785d2e6a4db1a57034cdc5e3d14439dc390d43c7355')
sha512sums_armv7h=('81ffc312f5d7b54554d16b98b7e406eb370ab4efbc8210098d0f025f312d9093ca5c380e42bc0d9e2d84b5450a8612bb63f11ff72764cc6b036511ae89b7ff90')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
