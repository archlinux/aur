pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1129.45d4f0e
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
sha256sums_x86_64=('4557ad5e71bc4892692c929fbddc9363b38673e5b819a7f1d1dff4fc5eef0325')
sha256sums_aarch64=('b178d36819cc8887674b1e4316ea219d2b314c8e6fe400ba962ca81e64e92702')
sha256sums_armv7h=('f132400099d0434c9efb9fe22913850adc54ae9623704b012bf9c7fc2c97232f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
