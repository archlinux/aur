# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=2.4.3
pkgrel=1
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="http://www.cmake.org/Wiki/CMakeUserUseLATEX"
license=('GPL')
depends=(cmake)
source=(http://www.cmake.org/Wiki/images/8/80/UseLATEX.cmake)
sha256sums=('35f2a12f35ab4f525b2c069482758414457d51f887210e33b12522cd2c39bec6')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.8/Modules/UseLATEX.cmake || return 1
}
