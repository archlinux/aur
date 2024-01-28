# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=playfair-font
pkgname=(otf-playfair ttf-playfair-variable)
pkgver=2.101
pkgrel=1
pkgdesc="A general purpose open source typeface family"
arch=('any')
url="https://github.com/clauseggers/Playfair"
license=('OFL-1.1')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('36ff92b7ed10c3c1767e228a172592af2fea14b2a98a2cc78202c7f920d4a6dc')

package_otf-playfair() {
    cd "Playfair-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF/" fonts/Static-CFF/*.otf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}

package_ttf-playfair-variable() {
    cd "Playfair-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" fonts/VF-TTF/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}
