# Maintainer: termuellinator

pkgname=lug-helper
pkgver=1.3
pkgrel=1
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'zenity')
provides=('lug-helper')
conflicts=('lug-helper')
url="https://github.com/the-sane/lug-helper"
license=('GPL3')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/the-sane/lug-helper/archive/v${pkgver}.tar.gz"
    'lug-logo.png'
    'lug-helper.desktop'
)
sha256sums=(
    '1e043b9d66414574817ba8cb364a6a8c755a27a975f7bcf54fca5fb91ee64c78'
    'eee2840ebb027a6f67748681626e6ce61d2b7b08dfc371a996665250a593c8ea'
    '2e8b5c5e425418ca335922d494f5b51f7ee6f721a61c6af395d0e3bb7dae5160'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/lug-logo.png" "$pkgdir/usr/share/pixmaps/lug-logo.png"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
 
