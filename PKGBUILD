# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=rawline-bin
pkgver=1.1
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
sha256sums=('e5e80063d784fdb8cd393035b5bebb7504b087c6734791d736c0cdc4fb6e2d5e')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
