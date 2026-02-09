pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.6+autobuild.0209.410b5bd
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
source=(".install")

sha256sums=('6d84ffbe405c9fee74af9e9147fce43aaad41de5ffaccff0a0d70ad7212fd91f')
sha256sums_x86_64=('40580eaca1d4ca99e2ee5ac8dc41e6a947f0812e7ef05a6ea5f75e6b81f83750')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
