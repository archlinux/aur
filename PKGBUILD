pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1203.bd24a3f
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
sha256sums_x86_64=('87cd86a9f108533148e944009604bbced4dd549b8ce7497881b7a67aaa989771')
sha256sums_aarch64=('7406ffe8a3cbb6a3844dfe1f58db18f59e7185f116c698df94d95a9cf8229a35')
sha256sums_armv7h=('559907b43793c646d93eb381b128a1ef7e277ba19914512fb08ef56e437e9b7a')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
