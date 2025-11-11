pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1111.e02f23e
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
sha512sums_x86_64=('7ee42c75f52395b901b00d4964cec84b829f55558c9272199d23ece22aeeecad37935f47e21bed0177180561fa3bb25a4db21426994e01cfdf64b8ed9d1acb14')
sha512sums_aarch64=('0642b762291440acfc2cc25ad553f7681f2ef7508ef5ea5dfc46910103003edff9978164ae74ad7b9574247b475e18670e76f645e1d77ea517a45f9208341f41')
sha512sums_armv7h=('bffb06dc8521f4c6ee48b0d0f50d0217cef8a9c5ca78c9081fac80b10396589301251c46cd9b2984236314eabaa5c991668fc872ed8152e3f5995061129dc4bf')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
