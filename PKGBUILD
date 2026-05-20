pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.5.2+autobuild.0520.46fb817
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

sha256sums_x86_64=('5faa8350d00fdedf282112c0b22fe6d7e66a729137c93483d7585574156842ae')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
