pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1110.7d42d5c
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin")
options=(!strip)
install=.install

source_x86_64=("Clash.Verge_${pkgver}_amd64_linux.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_amd64_linux.deb")
source_aarch64=("Clash.Verge_${pkgver}_arm64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("Clash.Verge_${pkgver}_armhf.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_armhf.deb")
source=(".install")

sha512sums=('8d1077b7849dfe505d16d77b8a9891bbcc7804154a6bd86c11a224274f41550ffa28dd212a3d9cf25c70c081c0976a717d0345b045e41c5db90f95e93b07c1a3')
sha512sums_x86_64=('0235a0c84bf3f0c6d4819f1f316d526e70c85b4b463c5daef051177ab1b5e5de87b32f5f8573e7a0a6c4a7e7a7aa9e2474a39f2bcf397b86999e72cb6e4f73c6')
sha512sums_aarch64=('0091a8da0b31b32cc8fe0f54c39bba7224af23343b0d101635dae793153f00e9e19e52105c3b3aa3c3ba546d24bde5f068caccfffe1c9ba4e2e3fb23118a5295')
sha512sums_armv7h=('e79bbd91e4411164e66a8f1a8f40af973888ac9316694b98e3a9fa11c2cc90c47c71f29a890cafce3d1a289c0072230aa55d5acbc9d60d6cdb565d3ebee83d8f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
