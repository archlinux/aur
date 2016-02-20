# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
# Contributor: Ariel Popper <a@arielp.com>
# Contributor: polyzen <polycitizen@gmail.com>

pkgname=termite-terminfo
pkgver=11
pkgrel=1
pkgdesc="Just the terminfo for termite (A Simple VTE-based terminal)"
arch=('any')
url="https://github.com/thestinger/termite/"
license=('LGPL')
makedepends=('ncurses')
conflicts=('termite')
source=("https://github.com/thestinger/termite/raw/v${pkgver}/termite.terminfo")
sha256sums=('771ecbde374ccefc40f06fb8ee0191bac1a81ab1f8f46b88288d1a9092770529')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/terminfo/x"
  tic -x termite.terminfo -o "${pkgdir}/usr/share/terminfo"
}

# vim:set sw=2 sts=2 et:
