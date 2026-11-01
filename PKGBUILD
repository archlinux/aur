# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=qthrone-bin
pkgver=1.9.6
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/qThrone"
license=('GPL3')
provides=('qthrone')
conflicts=('qthrone')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/qThrone/releases/download/v${pkgver}/qThrone-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('082db689e64fdcd2119e918b17d1c8c7422de4060346f56bfac355005214de88')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
