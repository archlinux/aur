pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1112.2ea22fe
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
sha512sums_x86_64=('1995ea802b6f99456bbd8015697f42df7803c87a0ea14e66de2b5f93b87633d3f351a2ee990c06c9e80ad173e6c4e95b51e1afd4a71483ccd7fd843d19f4da2c')
sha512sums_aarch64=('68f5848c47967d051f00c005061699eb571764178a1c22bb537343917cfbb275056647488f031da97c448fc6b1d48a2d158d238804980163a85e5851d58a8f40')
sha512sums_armv7h=('ba44decfeababa2bb53229ab0dec7712c437972ee433e9e6f14c5c3d30086b79d6d59a75e79ccc16ca4b36848a3d7e0bd0e5e7083fc2db6477b818a021eaeadc')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
