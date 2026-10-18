# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=qthrone-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/qThrone"
license=('GPL3')
provides=('qthrone')
conflicts=('qthrone')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/qThrone/releases/download/v${pkgver}/qThrone-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('a7ff54324c373107e1945745524f8b76f89b6158172c5bd2ef4fec884687e4ca')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
