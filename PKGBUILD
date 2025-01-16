# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.0.3
pkgrel=2
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

sha512sums_x86_64=('6f51b5779d2b77a1947e3f6854e3483fc4979a2a4d369b336e5cfb7feee00bef75ef3a88e5cfcfcd4d78f761a6800e689d76a4327d5b6eb42fce69c6ed77da9b')
sha512sums_aarch64=('d7fba116228a8246d812ba6ca7eabc77e1b1008a7200867a2bc9bd0e9b339adb4207834ffecfd71759da3bca61eb76def04ee0fed1e8808da10e0f14b838fad2')
sha512sums_armv7h=('54abf00d8267664ff6658ee44fb531e6fcbf1af41a1e8cee2f47a52639443d4464a316ed77d58d907e1c0123a018a9577d30889db29212c5f90976de5b79e340')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
