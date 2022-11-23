# Maintainer: Jorengarenar

pkgname=h2-dmenu-desktop
pkgver=0.8.3
pkgrel=1
arch=('any')
depends=(python dmenu)
url='https://github.com/Jorengarenar/h2-dmenu-desktop'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('778f7885e7df3b112fe3bd9a13dd905f7082b42fcf29ae329dabe705a3b2afd2')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
