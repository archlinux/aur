# Maintainer: Aman Gupta <aman.iv0012@gmail.com>

_pkgname=mcpat
pkgname=${_pkgname}-git
pkgver=1.3
pkgrel=1
pkgdesc="An integrated power, area, and timing modeling framework for multicore and manycore architectures"
arch=('any')
url="https://www.hpl.hp.com/research/mcpat/"
license=('')
groups=()
depends=('glibc')
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/HewlettPackard/mcpat")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "$_pkgname"
  make
}

package(){
  cd "$_pkgname"
  install -dm 755 "${pkgdir}/usr/bin"
  cp mcpat "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/bin/mcpat"
}
