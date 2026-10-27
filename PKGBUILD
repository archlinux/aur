# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=qthrone-bin
pkgver=1.9.2
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (binary release)"
arch=('x86_64')
url="https://github.com/ttrroyy/qThrone"
license=('GPL3')
provides=('qthrone')
conflicts=('qthrone')
options=('!strip' '!debug')
source=("https://github.com/ttrroyy/qThrone/releases/download/v${pkgver}/qThrone-${pkgver}-arch-x86_64.pkg.tar.zst")
sha256sums=('d823cd9ef7bfeec318cd3fbc88849a7d8f9b2d12646f4f0125d210c128a4abd4')

package() {
    cp -a "${srcdir}"/* "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.INSTALL"
}
