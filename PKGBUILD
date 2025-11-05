pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1105.3e2f605
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

sha512sums_x86_64=('239f3d463cfccbddabb9783c5a4f2e8e020f6f25660454ab17c143d93792f46b2027a02e436acb35cd9c990fec5b89f74df8f3d8b88b8dbb2a3bfe0d1e4bed84')
sha512sums_aarch64=('42d107f74669461b6a5e11bc115b49cef0e993cc7d1eb87c7c47de45a2f2009e6fd91427167b9eff92daf6d5cf56dd2f190d33d38667632c4e0178b2ccc372c4')
sha512sums_armv7h=('34038d25028eea13cb0baeb8bf68ee249755fd84b6116e852c8697985311c231b1b3951381031405525d70320db6d0609a89e99398c606828db415dc33dafc6e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
