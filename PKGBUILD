# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.2.0
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash' 'openssl-1.1')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('70d2afc44a9e6a8553bf25b608777c7af4dd4cb211a542663d6730b19f0e7d2267b6b781ccb71a572408bf98e7be5e4ba85c17e3890cb580c4d44b292dad3722')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
