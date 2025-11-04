pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1104.97769cf
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

sha512sums_x86_64=('cf0244add77db48e2a5c159945c905559acd482159923114ed42dabacc1b25b64e49aa9ab73a7289d8ed314430c3a327ed576fa1803bec145e17601e570b1e61')
sha512sums_aarch64=('e334bf789ee5f59754fbe8a9accc110112ece9f4517d69a842b02eefbb713783021728c1aaa2e6f1cbaa036fe7428f1d2bfb4a42c7e940ecec21778c9396666e')
sha512sums_armv7h=('3d959d14972ae6715c793b7ed8199b84f9476f94910875179f85fbf3b0a70e3ef703dda417435a57b6310aa6266c47ccd9a5d5cf8907e0f79dfee2cbf971cfab')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
