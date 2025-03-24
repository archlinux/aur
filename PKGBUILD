# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.2.1
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

sha512sums_x86_64=('6ce99059555e1cb2056137cc257e8f409cddf7cd60f8c52caa6a3e2f480232c05f681297b4479b71a3812e7a0f1a71f0555f9bf98e6fb375e6db5fbe1d42d390')
sha512sums_aarch64=('d642bf59a2135cd3feeb74e013e28a7974b83964810e24726978fbf84f09e70c4db3a4e17363677a69bd5842a65901935f20f51bbe647c0f831308dde24b1bad')
sha512sums_armv7h=('2c974b238f2fe9041e71afffe2acf853d856ccff48c37ba9e2aba32d687bb17b82faf467f68720a91c220002de53be9d79e22618ffcaa239570469f49781fb46')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
