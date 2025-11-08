pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1108.538cba5
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
sha512sums_x86_64=('1f28b473868d062621cd5b7f87dc15c23bc8be039ce234bfc5c397e4282189f8377d58f6f24a4aaabbcf02c86666d191c485d4d2e87ca4ebeb69f65cbc2392bb')
sha512sums_aarch64=('6338016d6e7ea47be2e8d0a8ce70c73300efb5ef12abcfb5039fbd7d2529daa645ce96a823e0b029fa4e05b4d9cdc459fc5937cc82f77ed62dd4fe7c9247b15d')
sha512sums_armv7h=('0eb095951cd635fc9ec9d381c4d40639498d8b51b0dfb9bc655cb532195db8b154ab310af18f7e11caabc474c0170bd79ad56819fb515b2db09e21fe956fe276')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
