# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=qthrone-bin
pkgver=1.9
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/qThrone"
license=('GPL3')
provides=('qthrone')
conflicts=('qthrone')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/qThrone/releases/download/v${pkgver}/qThrone-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('9156397cacdff8d5018ec920044b56e52e74080914a3128f226a3213083785b4')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
