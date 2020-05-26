# Maintainer: Steven Huang <s@stvhuang.me>

pkgname=ttf-cmu-bright
pkgver=1.0
pkgrel=1
pkgdesc="CMU Bright"
arch=('any')
url="https://fontlibrary.org/en/font/cmu-bright"
license=('OFL')
depends=()
source=('https://fontlibrary.org/assets/downloads/cmu-bright/89df0df002bd3fe4185cc5d8f98a124c/cmu-bright.zip')
sha256sums=('f5cb3bfd52c2025ec3dd7342650583bd7ab9aa3c1528c3e0eb67f6177c207a2c')

package() {
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 Bright/*.ttf
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 "Bright Semibold"/*.ttf
    install -vDm644 Bright/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
