# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.5
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

sha512sums_x86_64=('d8268a8db28c10b895b4b2964436bbc54bbb00fcfcfb8cb23f86e0c2f7e381c5b4782cffb1b7bd0670ce5212f915cae448cbbf07ceb1fa55d3e280c1412e7a43')
sha512sums_aarch64=('0d1d98241873656d5d1dbca036b8b85d26ec959adec9ea787b43739f62c2de6768cd3a7aa964c21b11ee9dbb9f3446c0063cc9e7cf0c862c17f89c3d9e6aed9d')
sha512sums_armv7h=('6c2320fb0fe604b3989de6ce81d927ba94ba9f4fd7aefc32d861fe9365e4d84ddd40c308ea7aae194d5121e13bbaf312a3ead76b3c1e10cfba67f1f5d221053c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
