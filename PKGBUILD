# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.2.1
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash' 'openssl-1.1')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('c73cfe2b1fbf2b60a4819413db37684c1a1b3813d8e3acb77822ca0edb8ec10253da360a994a3e89960ff1a1f6b5406c0dde47cb5d6d3ea57ef691a21d7394df')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
