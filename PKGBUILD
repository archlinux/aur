# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=rawline-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/Rawline"
license=('GPL3')
provides=('rawline')
conflicts=('qthrone' 'qthrone-bin')
replaces=('qthrone-bin')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/Rawline/releases/download/rawline-${pkgver}/Rawline-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('22d2161876f35c558d5ab36617e761138c4734e964668541d7e7de951675dd54')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
