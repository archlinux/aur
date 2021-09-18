# Maintainer: termuellinator

pkgname=lug-helper
pkgver=1.9.2
pkgrel=2
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'bc')
optdepends=('zenity' 'polkit')
provides=('lug-helper')
conflicts=('lug-helper')
url="https://github.com/the-sane/lug-helper"
license=('GPL3')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/the-sane/lug-helper/archive/v${pkgver}.tar.gz"
    'lug-helper.desktop'
)
sha256sums=(
    'b083365f432a37400abaa18215c4c79cc7cdc1d2a3bca08ba6e8527081eb2e00'
    'a69118baac0cd55dfb85a81de1873ab1fee85d3477e13c10628a824ebdc5e22f'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-logo.png" "$pkgdir/usr/share/pixmaps/lug-logo.png"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
 
