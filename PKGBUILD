# Maintainer: Slinet <aur@slinet.me>

pkgname=clash-verge-rev-alpha-bin
_pkgname=clash-verge-rev
pkgver=2.0.0
pkgrel=9
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri | Alpha Version"
arch=('x86_64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname-bin" "$_pkgname-alpha" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/alpha/Clash.Verge_${pkgver}_amd64.deb")

sha512sums_x86_64=('6e222cbbd66cad061ca196455e2b8b9e7a0f82569a37ca1da2ee8b520dcabfc081f486fce24dfd5b670cb6e49b7bcf0941d69e66dbc23ba628b780018f400677')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

