# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=1.10.5
pkgrel=4
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="http://www.cmake.org/Wiki/CMakeUserUseLATEX"
license=('GPL')
depends=(cmake)
source=(http://www.cmake.org/Wiki/images/8/80/UseLATEX.cmake)
sha256sums=('c54d2cbf3c4bc723a37d3a72b9580978b9573962f88ea0c6af259d2b38be8347')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.2/Modules/UseLATEX.cmake || return 1
}
