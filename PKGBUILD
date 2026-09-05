pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.5.4+autobuild.0905.d8b94d1
pkgrel=1
epoch=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin")
options=(!strip)
install=.install

source_x86_64=("Clash.Verge_${pkgver}_amd64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_amd64.deb")

sha256sums_x86_64=('ea1865b2e917d9151de876572a1507ddab220fa08d36b0779095c3dd119a64a4')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
