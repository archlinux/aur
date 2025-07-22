# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.3.2
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

sha512sums_x86_64=('f4fd2b58a8e253927460dcf5cfa3188684df7adc5a91d6e9871ca5c742fb2ddb65277412355b1bf6de3834a1680dafc56f113f1d4862cd1c82c6c6d7fc95e2ce')
sha512sums_aarch64=('0a6a3994a09673b1a1b760401a5cf721f1102f5c8e8b70a6b3aaeac5a853183953b18e7e62628b3157d5a9755a1f4543c61ab7bd8a89c0bc5bb943389eaf32e0')
sha512sums_armv7h=('80bb6e954fc4eb6b1f5e0afa3d050dfccba3b44764e3dcb86d919c48a0ce3ed7a0f103a5230f8928554a44c5e0fae7e6fdd68c0c8dd89920e0717b570777bb07')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
