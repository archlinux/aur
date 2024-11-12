# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=playfair-font
pkgname=(ttf-playfair-variable)
pkgver=2.203
pkgrel=1
pkgdesc="A general purpose open source typeface family"
arch=('any')
url="https://github.com/clauseggers/Playfair"
license=('OFL-1.1')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91953645ea50dab5c4fce9996ad94b1a685494fadb99ebc9e2277aa4c1330230')

package_ttf-playfair-variable() {
    cd "Playfair-${pkgver}"
    install -Dm644 fonts/VF-TTF/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
