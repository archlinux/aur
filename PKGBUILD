# Maintainer: Jorengarenar

pkgname=h2-dmenu-desktop
pkgver=0.8.1
pkgrel=1
arch=('any')
depends=(python dmenu)
url='https://github.com/Jorengarenar/h2-dmenu-desktop'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('355624d3caf95db38b1bf56665cf2d3e77f4fb6ef1eddd4328244ea3850a9e05')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
