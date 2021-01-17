# Maintainer: termuellinator

pkgname=lug-helper
pkgver=1.4.1
pkgrel=1
pkgdesc="Star Citizen's Linux Users Group Helper Script"
arch=('any')
depends=('bash' 'coreutils' 'curl')
optdepends=('zenity')
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
    '9fab407416e26e9b766ce98894a1481a37652e71bcaeb5439a403888418bae3d'
    'eee2840ebb027a6f67748681626e6ce61d2b7b08dfc371a996665250a593c8ea'
    '2e8b5c5e425418ca335922d494f5b51f7ee6f721a61c6af395d0e3bb7dae5160'
)


package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/lug-helper.sh" "$pkgdir/usr/bin/lug-helper"
    install -Dm755 "${srcdir}/lug-logo.png" "$pkgdir/usr/share/pixmaps/lug-logo.png"
    install -Dm755 "${srcdir}/lug-helper.desktop" "$pkgdir/usr/share/applications/lug-helper.desktop"
}
 
