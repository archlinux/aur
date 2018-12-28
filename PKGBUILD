# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=cmake-uselatex
pkgver=2.4.9
pkgrel=1
pkgdesc="CMAKE commands to actually use the LaTeX compiler"
arch=(any)
url="https://gitlab.kitware.com/kmorel/UseLATEX/"
license=('BSD3')
depends=(cmake)
source=("https://gitlab.kitware.com/kmorel/UseLATEX/raw/Version${pkgver}/UseLATEX.cmake")
sha256sums=('f1a9ea8954a8714ab19b970f02ec3cf895b6f1b6d7f6a341fec8d09aedf37fbf')

package() {
    cd "$srcdir"
    install -D UseLATEX.cmake ${pkgdir}/usr/share/cmake-3.13/Modules/UseLATEX.cmake || return 1
}
