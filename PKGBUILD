# Maintainer: Alessandro Bernardello
pkgname=banana-cursor-bin
pkgver="2.0.0"
pkgrel=1
pkgdesc="The banana mouse cursor"
arch=('any')
url="https://github.com/ful1e5/banana-cursor/releases/tag/v${pkgver}"
license=('GPL-3.0')
source=("https://github.com/ful1e5/banana-cursor/releases/download/v${pkgver}/banana-all.tar.xz")
sha256sums=('9ad7afa7d005da895393565241acde9064c65f185b2b49692d2ed13fe29de734')
provides=("banana-cursor")
conflicts=("banana-cursor")

package() {
    install -dm755 "${pkgdir}/usr/share/icons/"
    mv "${srcdir}/Banana" "${pkgdir}/usr/share/icons/"
    mv "${srcdir}/Banana-Blue" "${pkgdir}/usr/share/icons/"
    mv "${srcdir}/Banana-Green" "${pkgdir}/usr/share/icons/"
    mv "${srcdir}/Banana-Red" "${pkgdir}/usr/share/icons/"
}