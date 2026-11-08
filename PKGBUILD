# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=rawline-bin
pkgver=1.0
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
sha256sums=('36e1f1bfb840a83cb8961722d530b6bf72fc155ee4a08dd10ac7a007847f9d97')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
