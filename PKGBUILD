# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.3.0
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

sha512sums_x86_64=('54936bce8f9e613d72381abd0dd268ee1898d79d35ba1ae8862c04e1094ebd5e9fc9b57f73bac86ec6d92cc41083caf20a6b55051482dccf6b7334bedf6bcc40')
sha512sums_aarch64=('a564716b97a4d66737b122bd8e0cad5645efb468fbf97dd736265938e2cd0e4b75ec80ebca927c0263caed652b4565a5f2621452143bb6d1ed07aeb3dcc999ed')
sha512sums_armv7h=('1460d549fc2030f376a4f361ee2a3ac565692861c516cf90dd5dd567abb9eb6e060b8ae71582c3450317bfb6467cfa765853d6852188fecde7aa5124b45253dc')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
