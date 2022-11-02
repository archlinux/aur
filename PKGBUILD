# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.1.2
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('11deca13668c42cb08d538d8184ae33802586b75eef2858915d3762ceecce775e8d39b33f207fcf289c49c2d2391183ef6c1f749c1037030baccf558d0890bc7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
}
