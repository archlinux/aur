pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1109.2f7b3bb
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
sha512sums_x86_64=('77bcbf40e24eac596bbe6d4fb36cafc712afecfe144aa2c29a28e3b543886bfd64f7f56fe08735529e4017e887ff6559e166871a16b4a3ae168621cc811367dd')
sha512sums_aarch64=('848a3e422eab0947d8f75ebe19345adb4f9fc2f131ea1d93c75f5c42914e4f359f9eebde05bba28d48d25a9e279fc122290525bd2786b44cd268c74326334c03')
sha512sums_armv7h=('cb132aaeb8f8037e44e5031e8f8db8104474b791bdfc4455a3c05a68204ee6e9a75d1ac8e3a50a69cb14c281aabae8ee23cb7e10797a967cf2ba2656bbef1698')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
