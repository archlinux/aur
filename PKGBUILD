# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.3.6
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('9feb0f9c5206b6d58715ea104b1d16802183488b251359903cb86c5cb37d8006bca6175ad52a7093c36531ecc886ee322f76b0ffde42e9b43d0c5eb461bea6f9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
