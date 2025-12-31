pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.5+autobuild.1231.cb5a2e7
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

sha256sums=('35b576cd9d0ae453ead9f65537451137069150a91364f0560ea14100e79b35e3')
sha256sums_x86_64=('01efa3792df9eb1e67c94ca9336208be3743135bb909288d06221b752d12e78b')
sha256sums_aarch64=('c52a165f393f0c2caaea4e49f68858272ec762c7abefcae3b40b625302c58012')
sha256sums_armv7h=('45029344f77ac124c00d93bff7ffb1ef739e92ef05384649ae6985388131d103')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
