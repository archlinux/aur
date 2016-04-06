# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=2.3.0
pkgrel=1
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="http://www.cmake.org/Wiki/CMakeUserUseLATEX"
license=('GPL')
depends=(cmake)
source=(http://www.cmake.org/Wiki/images/8/80/UseLATEX.cmake)
sha256sums=('97492e447fa5135cf3f6eead92a8c5f97328fcb68634d4e21dc00dbdcd90337d')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.5/Modules/UseLATEX.cmake || return 1
}
