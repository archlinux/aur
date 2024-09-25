# Maintainer: Slinet <aur@slinet.me>

pkgname=clash-verge-rev-alpha-bin
_pkgname=clash-verge-rev
pkgver=2.0.0
pkgrel=10
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri | Alpha Version"
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname-bin" "$_pkgname-alpha" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/alpha/Clash.Verge_${pkgver}_amd64.deb")

sha512sums_x86_64=('0bc1186d90fa9149433f483c302adb43bad51a52fbc390b92cb30e883a32bf2b619354bbd850dbec0da825df96420fd5ca2ff1b6129dc280cd54d44a7c3b90b7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

