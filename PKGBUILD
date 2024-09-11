# Maintainer: Slinet <aur@slinet.me>

pkgname=clash-verge-rev-alpha-bin
_pkgname=clash-verge-rev
pkgver=2.0.0
pkgrel=3
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri | Alpha Version"
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname-bin" "$_pkgname-alpha" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/alpha/Clash.Verge_${pkgver}_amd64.deb")

sha512sums_x86_64=('5aea2678e9c202e75c47052ff6cb735a9f4d56ec1b140119ab3abac308d611034fe8cafe8505775dc95a07714ab10a20e66c1f286c8de1e7c0f50ab5ff702842')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

