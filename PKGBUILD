pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1113.d73036a
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
sha512sums_x86_64=('dca220d944f15673e528c7bd0d598eeb030a1c0da4daf1568229cc1510954b6d0e81c1ecde4d010895d14552370d875ef7ea0c9602219b727aad0681a0f57d3d')
sha512sums_aarch64=('cb7619ec96140e132faaffd6cdfac8c7e8af355e59c7fe5e1a3cd3da838ab119af3bf4748a6c4e681f46e3220c58c1b170c30d1914a0e920cefaccee7c7217c4')
sha512sums_armv7h=('255d042dc662c2bf44e9716c54078740c3f0cd15550d6a2c364b511d01cba2cfc9d4b9afae3c323135c62321be53e1175c3e2aa12cc195d60583c35a62d114b7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
