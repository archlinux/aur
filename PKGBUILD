# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=2.4.2
pkgrel=1
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="http://www.cmake.org/Wiki/CMakeUserUseLATEX"
license=('GPL')
depends=(cmake)
source=(http://www.cmake.org/Wiki/images/8/80/UseLATEX.cmake)
sha256sums=('35df2e4e3bede7f38e0d8bf984a9a0d698a64d3a62cb9af4aaeb61ae73f0067e')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.7/Modules/UseLATEX.cmake || return 1
}
