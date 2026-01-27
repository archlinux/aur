# Maintainer: coolcoala
# Submitter: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=Koala.Clash
pkgver=0.2.10
pkgrel=1
pkgdesc="Fork of Clash Verge Rev | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/coolcoala/koala-clash"
license=('GPL3')
depends=('webkit2gtk-4.1' 'webkitgtk-6.0' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-verge-rev" "clash-verge-rev-bin" "clash-verge-rev-autobuild" "clash-verge-rev-autobuild-bin")
options=('!strip')
install=${pkgname}.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_gitpkgname}_armhf.deb")

sha256sums_x86_64=('f733733790c9f1e9e60584579539ed753f4b37a5e6e422f678bdb8609936ba0c')
sha256sums_aarch64=('9961959abdb3eddffcfe1366752af4b63bb69e6470b9c080fadec66c260c1c8a')
sha256sums_armv7h=('f2737403c8af5ba8ba31f474d27a955231aa9e9b4d5fb9110312e84cc712ada0')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
