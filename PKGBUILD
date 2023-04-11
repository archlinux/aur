# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.3.1
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('2659f56fed0f7a5277a961300dd25d53907392792e8ba21e0f223b3aa784a3c4042851a5e6cd2a0ed5c2c9eeb14eb209125664feeedd5b590f8179942eff25fe')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
