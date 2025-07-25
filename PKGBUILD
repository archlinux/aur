# Maintainer: coolcoala
# Maintainer: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=clash-verge-rev-lite
pkgver=0.2.3
pkgrel=1
pkgdesc="Fork of Clash Verge Rev | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/coolcoala/clash-verge-rev-lite"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-verge-rev" "clash-verge-rev-bin" "clash-verge-rev-autobuild" "clash-verge-rev-autobuild-bin")
options=('!strip')
install=${pkgname}.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge.Rev.Lite_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge.Rev.Lite_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge.Rev.Lite_${pkgver}_armhf.deb")

sha256sums_x86_64=('a8d60d58d944a0040ec1f2949cfa73e908dd4fcaf07919bbd92ea826d908b2a5')
sha256sums_aarch64=('fe1e31c5142214820273ca4e736f33905fa88571417b66c8a37babff55f9283b')
sha256sums_armv7h=('be472b3bf3a173a3adb28b3f4698ae1d88ed3b5bf27f9de233b5cd56bf4ecc51')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}