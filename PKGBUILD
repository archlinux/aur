# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=qthrone-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/qThrone"
license=('GPL3')
provides=('qthrone')
conflicts=('qthrone')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/qThrone/releases/download/v${pkgver}/qThrone-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('0b2d19b5b76cc5787a550dcebd691d297b0467ccb27e25639d82ce470a6be158')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
