pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1119.9e3bc6d
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
sha512sums_x86_64=('7f47929fd061dd67e144e176db049e72921bdbe03fbe4250eceb13dd43f6747aff62455fbceb838a7fedae328ae571c680dc8d653e9832ec0601fddd5301e4f0')
sha512sums_aarch64=('7ee1ab59b7252c82d898d5f0dec4b9f343632a12560f01eee1b0cafc24c0d999d3ff2886040e1c1ee316ab8ecd965f85d5c654960d659a9cc5dc1c1c4d1816d4')
sha512sums_armv7h=('08c240d455e8b0d315adf1e4ee5caa3e5bd78f06baba41c57b32f895955f1a2c011636af7a483e7d6df3356999fae6646fb0c97ea7fa46736e59ab72aa4f065c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
