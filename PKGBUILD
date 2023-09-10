# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.3.7
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('38fdeb8698cf4645549a4f44d01f5b0ddf8295f083a5d14426d104b8c3665432f08bca3737232a7db74097eb9c626bff795ff5aac2d67345f178273753e02e9c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
