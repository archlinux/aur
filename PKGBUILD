# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.3.1
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

sha512sums_x86_64=('abadac84bc1b6e9b67d0505666ce3f9dcb536913b00f2e67e81cb9091dbd942da88651590c76b315eaa5b6d7beb526827d69cc175912967dcc31d9cce2aa7bab')
sha512sums_aarch64=('51c1029da70f76b1bfc527a72f038b09628418e5ade762ff9ac393290e5454906c8cd5ec30e0b6959520a673abe49e422712cde63d0eec0f4d9f50cba15aa53c')
sha512sums_armv7h=('8ae9e0ed5833571cabc737550b7515b33b72f45e347d3c56d0ccd72e4a7383088b7bce4fefd3dab519a0369a3cc8ff389422aa201e23bab941c47d6fd76461ce')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
