# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.2.2
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

sha512sums_x86_64=('431bcc21566e6f7465d96bf746602cad24e906c655de292ef17737c7ae3465e466c5278918dc689295d503b6730f4a0cbf69aaef24ad95eec8a3a1b9a4edfa5d')
sha512sums_aarch64=('da56152acf2a8e09330ce1620580ee591b84ef5ca11e36a0b2745f50d4eed6403debcf13d55d9c9039ccfe030358e634e5a2b0f054c2f3ede686c116af47c738')
sha512sums_armv7h=('feada3e0ecc86b5620b3549dd8989c15f05afc0c08636f1592f3e336bdcca4b48b4fdb1879f4b2aad28b474a14e24fcf10271373792d3483c734204e3cde9a52')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
