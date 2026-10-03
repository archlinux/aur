# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.7
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

sha512sums_x86_64=('0c349e6a4df6aa45d93456ed9663b2b29dba536fbe5095a6cf7dee022b0f3d6e942967d3ad760e2e39b9eaa23c19621dee311c1af0721853984a2a5f0717d494')
sha512sums_aarch64=('0a73bd4903acb6090ae787bb59d71d503140d80a4c4c567f3c845a5e20332063949c991062ea82c933b1c11c1580d8469568d45390e1135f95851f61b41214c2')
sha512sums_armv7h=('947235f75fa4b42736362d562f6082d80f43fff373b714a098ebee99d055274e3c98ba64d321f8becaa70193a532286b6fe0a3c93a360f5a7d61253c1f51425d')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
