# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.3.4
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('5f711e8d78dc9ee35842b558a2c1ac09e56934e9b1782ad40625182b9e5284296700378a5c5793561f9569e711f08e1de784cd16d8b1c573020bc4932972ef7b')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
