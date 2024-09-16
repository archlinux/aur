# Maintainer: Slinet <aur@slinet.me>

pkgname=clash-verge-rev-alpha-bin
_pkgname=clash-verge-rev
pkgver=2.0.0
pkgrel=5
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri | Alpha Version"
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname-bin" "$_pkgname-alpha" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/alpha/Clash.Verge_${pkgver}_amd64.deb")

sha512sums_x86_64=('5bda44d4f9ff83d2cadf3ebaf75c1c66d7d541c7bee965afe6155ad0368e1cf7c5732f63364eebeeabb84e91a8d1c2e8661f5a35f3f456689a040f80b8e27f46')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

