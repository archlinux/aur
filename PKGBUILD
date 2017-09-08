# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=2.4.5
pkgrel=1
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="http://www.cmake.org/Wiki/CMakeUserUseLATEX"
license=('GPL')
depends=(cmake)
source=(http://www.cmake.org/Wiki/images/8/80/UseLATEX.cmake)
sha256sums=('77f35664496e65ad2faa66c4609ce1d67dbd75a9f7fd2f02f46f4e1bcc71d550')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.9/Modules/UseLATEX.cmake || return 1
}
