pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1114.4e800d1
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin")
options=(!strip)
install=.install

source_x86_64=("Clash.Verge_${pkgver}_amd64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("Clash.Verge_${pkgver}_arm64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("Clash.Verge_${pkgver}_armhf.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_armhf.deb")
source=(".install")

sha512sums=('8d1077b7849dfe505d16d77b8a9891bbcc7804154a6bd86c11a224274f41550ffa28dd212a3d9cf25c70c081c0976a717d0345b045e41c5db90f95e93b07c1a3')
sha512sums_x86_64=('fc8df1a2bc3e2f951f56b51827b98c4799d22efa84cecf6da1bf86ab6b7f05b1b36be27da20fe9d64de8d90deb2b4e9a0906d73b2d49705cdfd1f4ba5d369950')
sha512sums_aarch64=('be23aeb32b89c034142988bcee31cb7496d5a4d8926e466bfa79e989e04becbbf8912c52c566944e377650b7b7f4029260a40e03ec0fae542abdf3115a942e87')
sha512sums_armv7h=('eeaf785149cb8695b23bdae4bbf69ffa963b56946fd176f409af9f6e2b9ed80d0ce7708749014d051af40c31acb88c4f1a5b0b1c7d368b1dfe5bbb15b94766de')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
