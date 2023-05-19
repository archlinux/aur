# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.3.2
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('90839c4c5fcd28afc4d65da6fa6fef9da76fb75b340017efb1a134a931593fc084770003031a0c6c6e9b5d6242426c2689009111b7b7a1baf88159a499fe580c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
