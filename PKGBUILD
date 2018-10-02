#
# PKGBUILD for hexcompare
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=hexcompare
pkgver=1.0.4
pkgrel=1
epoch=
_pkgname=hexcompare
_pkgver=${pkgver}
pkgdesc="Curses-based utility to compare and identify differences between two binary files"
arch=("i686" "x86_64")
url="https://sourceforge.net/projects/hexcompare/"
license=("GPL3")
groups=()
depends=("ncurses")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
_srcdirname="${pkgname}/tags/v${pkgver}"
source=("git+https://github.com/svn2github/hexcompare.git")
md5sums=("SKIP")

#
#
#

#pkgver() {
#  cd "${srcdir}/${_srcdirname}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}


prepare() {
  cd "${srcdir}/${_srcdirname}"
}

build() {
  cd "${srcdir}/${_srcdirname}"
  make
}

check() {
  cd "${srcdir}/${_srcdirname}"
}

package() {
  cd "${srcdir}/${_srcdirname}"
  install -m755 -D hexcompare "${pkgdir}/usr/bin/hexcompare"
  install -m755 -D README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

#
# EOF
#
