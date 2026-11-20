# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=rawline-bin
pkgver=1.2
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
sha256sums=('b97b2f550ef95d784c59d6c344bc770e451c0cb0e31e8b4687c024286d0d939f')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
