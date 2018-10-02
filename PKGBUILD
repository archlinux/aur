#
# PKGBUILD for asm6f
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=asm6f
pkgver=1.6_freem02
pkgrel=2
epoch=
_pkgname=asm6f
_pkgver=${pkgver}
pkgdesc="A 6502 assembler primarily targeted at NES/Famicom development."
arch=('i686' 'x86_64')
url="https://github.com/freem/asm6f"
license=()
groups=()
depends=()
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
_srcdirname=${_pkgname}-${_pkgver}
source=("https://github.com/freem/${_pkgname}/archive/v${_pkgver}.tar.gz")
md5sums=('f87769e3781c8f934bc5159ec663aceb')

#
#
#

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
  install -m755 -D asm6f "${pkgdir}/usr/bin/asm6f"
  install -m644 -D readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  install -m644 -D readme-original.txt "${pkgdir}/usr/share/doc/${pkgname}/readme-original.txt"
}

#
# EOF
#
