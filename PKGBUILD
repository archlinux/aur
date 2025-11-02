pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1102.4a7859b
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

sha512sums_x86_64=('8daf46d0dbe793e22c80db2e349be4be2a5a6fdfb8d73c0f00330aa6c913ee7d8aac0d02b9d97da6e54a4bdafe5af39407e8067769390574e53ea1cf13b3f5ea')
sha512sums_aarch64=('6036758b4b20b192a45d8068903d3ef303f6c92afd13cd9a4c356bce60066e52a7ee0dc95265ee67f97b40d46948aee736eaa25d1a017085c28b69d4be03103b')
sha512sums_armv7h=('1593b0cbe3b673b89b45b9d75285a4705cac6e27290e6e3375bdb950398aec7cdaf2a454a48923fd9152eb8a6e57c1cd3a97fb9b64b9b0c4f9c20fc68735976c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
