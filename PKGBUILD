# Maintainer: Jorengarenar

pkgname=h2-dmenu-desktop
pkgver=0.8.2
pkgrel=1
arch=('any')
depends=(python dmenu)
url='https://github.com/Jorengarenar/h2-dmenu-desktop'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5cf71baa4a4b12732d526f4f6052909e38b81bb2f3ab73553751635b052fd332')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
