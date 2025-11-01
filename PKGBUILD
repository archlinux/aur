pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1101.ae31927
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

sha512sums_x86_64=('2de7773719581d8ec49596bbf95ed4bbfc3a6133b9ec18b301294a1a108ebc3dfe162bd82cdcd541580f83bcaf219f429b10ce344dc8800aa64baf1ecc2cd0f6')
sha512sums_aarch64=('a859560caa489a7e6fb84c2f5830fcddc0deaedbc761ac9fb69cc97ccd10e2282ade4038cd60d65c937430598d2477a3b6bc387b9a4b30f80bd38b10ef9bcfa1')
sha512sums_armv7h=('32302108ef8aafc136e18873275951e630d3967d4d9b8675857cf1ce4ee21dea2c6de5350f925e5b781c994313dc06f54c8bd2bc3d35d8500842edf64fd654e6')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
