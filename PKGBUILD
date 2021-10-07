# Maintainer: Jorengarenar

pkgname=h2-dmenu-desktop
pkgver=0.8.0
pkgrel=1
arch=('any')
depends=(python dmenu)
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aade9e11704187a4e5c374192c65d3548d3461dae919b68fe92bedf6351c7882')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
